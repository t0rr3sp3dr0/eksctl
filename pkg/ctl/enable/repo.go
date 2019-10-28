package enable

import (
	"context"
	"time"

	"github.com/kris-nova/logger"
	"github.com/spf13/pflag"
	api "github.com/weaveworks/eksctl/pkg/apis/eksctl.io/v1alpha5"
	"github.com/weaveworks/eksctl/pkg/ctl/cmdutils"
	"github.com/weaveworks/eksctl/pkg/gitops/flux"
)

const (
	gitURL               = "git-url"
	gitBranch            = "git-branch"
	gitUser              = "git-user"
	gitEmail             = "git-email"
	gitPaths             = "git-paths"
	gitFluxPath          = "git-flux-subdir"
	gitLabel             = "git-label"
	gitPrivateSSHKeyPath = "git-private-ssh-key-path"
	namespace            = "namespace"
	withHelm             = "with-helm"
)

func enableRepo(cmd *cmdutils.Cmd) {
	cmd.ClusterConfig = api.NewClusterConfig()
	cmd.SetDescription(
		"repo",
		"Set up a repo for gitops, installing Flux in the cluster and initializing its manifests in the specified Git repository",
		"",
	)
	opts := ConfigureRepositoryCmd(cmd)
	cmd.SetRunFuncWithNameArg(func() error {
		return Repository(cmd, opts)
	})
}

// ConfigureRepositoryCmd configures the provided command object so that it can
// process CLI options and ClusterConfig file, to prepare for the "enablement"
// of the configured repository & cluster.
func ConfigureRepositoryCmd(cmd *cmdutils.Cmd) *flux.InstallOpts {
	var opts flux.InstallOpts
	cmd.FlagSetGroup.InFlagSet("Enable repository", func(fs *pflag.FlagSet) {
		cmdutils.AddCommonFlagsForFlux(fs, &opts)
	})
	cmd.FlagSetGroup.InFlagSet("General", func(fs *pflag.FlagSet) {
		fs.StringVar(&cmd.ClusterConfig.Metadata.Name, "cluster", "", "name of the EKS cluster to enable gitops on")
		cmdutils.AddRegionFlag(fs, cmd.ProviderConfig)
		cmdutils.AddConfigFileFlag(fs, &cmd.ClusterConfigFile)
		cmdutils.AddTimeoutFlagWithValue(fs, &opts.Timeout, 20*time.Second)
	})
	cmdutils.AddCommonFlagsForAWS(cmd.FlagSetGroup, cmd.ProviderConfig, false)
	cmd.ProviderConfig.WaitTimeout = opts.Timeout
	return &opts
}

// Repository enables GitOps on the configured repository.
func Repository(cmd *cmdutils.Cmd, opts *flux.InstallOpts) error {
	cmdutils.ValidateGitOptions(&opts.GitOptions)
	if err := cmdutils.NewGitOpsConfigLoader(cmd).Load(); err != nil {
		return err
	}

	k8sClientSet, k8sRestConfig, err := KubernetesClientAndConfigFrom(cmd)
	if err != nil {
		return err
	}

	installer := flux.NewInstaller(k8sRestConfig, k8sClientSet, opts)
	userInstructions, err := installer.Run(context.Background())
	logger.Info(userInstructions)
	return err
}
