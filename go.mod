// Make sure to run the following commands after changes to this file are made:
// `make -f Makefile.docker update-build-image-manifest && make -f Makefile.docker push-build-image`
module github.com/weaveworks/eksctl

go 1.12

require (
	github.com/alecthomas/jsonschema v0.0.0-20190530235721-fd8d96416671
	github.com/aws/aws-sdk-go v1.44.158
	github.com/awslabs/goformation v0.0.0-20190320125420-ac0a17860cf1
	github.com/blang/semver v3.5.1+incompatible
	github.com/christopherhein/go-version v0.0.0-20180807222509-fee8dd1f7c24
	github.com/cloudflare/cfssl v0.0.0-20190726000631-633726f6bcb7
	github.com/dave/jennifer v1.3.0
	github.com/dlespiau/kube-test-harness v0.0.0-20190110151726-c51c87635b61
	github.com/evanphx/json-patch v5.6.0+incompatible
	github.com/fluxcd/flux v1.15.0
	github.com/fluxcd/helm-operator v1.0.0-rc2
	github.com/gobuffalo/envy v1.7.0 // indirect
	github.com/gobwas/glob v0.2.3
	github.com/gohugoio/hugo v0.55.6
	github.com/goreleaser/goreleaser v0.134.0
	github.com/instrumenta/kubeval v0.0.0-20190804145309-805845b47dfc
	github.com/justinbarrick/go-k8s-portforward v1.0.4-0.20190722134107-d79fe1b9d79d
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/kevinburke/go-bindata v3.15.0+incompatible
	github.com/kris-nova/logger v0.0.0-20181127235838-fd0d87064b06
	github.com/kris-nova/lolgopher v0.0.0-20180124180951-14d43f83481a // indirect
	github.com/kubernetes-sigs/aws-iam-authenticator v0.4.0
	github.com/kubicorn/kubicorn v0.0.0-20180829191017-06f6bce92acc
	github.com/lithammer/dedent v1.1.0
	github.com/onsi/ginkgo v1.16.5
	github.com/onsi/gomega v1.20.2
	github.com/pkg/errors v0.9.1
	github.com/riywo/loginshell v0.0.0-20190610082906-2ed199a032f6
	github.com/sanathkr/yaml v1.0.0 // indirect
	github.com/spf13/afero v1.9.2
	github.com/spf13/cobra v1.6.1
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.14.0
	github.com/stretchr/testify v1.8.1
	github.com/tidwall/gjson v1.1.3
	github.com/tidwall/match v1.0.0 // indirect
	github.com/tidwall/sjson v1.0.2
	github.com/vektra/mockery v0.0.0-20181123154057-e78b021dcbb5
	github.com/voxelbrain/goptions v0.0.0-20180630082107-58cddc247ea2 // indirect
	github.com/weaveworks/github-release v0.6.2
	github.com/weaveworks/launcher v0.0.0-20180711153254-f1b2830d4f2d
	github.com/whilp/git-urls v0.0.0-20160530060445-31bac0d230fa
	github.com/zmap/zlint v0.0.0-20190806182416-88c3f6b6f2f5 // indirect
	go.etcd.io/etcd v3.3.11+incompatible // indirect
	go.opentelemetry.io/otel/internal/metric v0.27.0 // indirect
	golang.org/x/crypto v0.6.0 // indirect
	golang.org/x/tools v0.1.12
	k8s.io/api v0.25.5
	k8s.io/apiextensions-apiserver v0.25.2
	k8s.io/apimachinery v0.25.5
	k8s.io/client-go v11.0.0+incompatible
	k8s.io/code-generator v0.25.5
	k8s.io/csi-api v0.0.0-20190301175547-a37926bd2215 // indirect
	k8s.io/helm v2.13.1+incompatible
	k8s.io/kops v1.25.4
	k8s.io/kubelet v0.25.5
	k8s.io/kubernetes v1.13.0
	sigs.k8s.io/yaml v1.3.0
)

replace (
	// Override since git.apache.org is down.  The docs say to fetch from github.
	git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999
	github.com/Azure/go-autorest => github.com/Azure/go-autorest v10.14.0+incompatible
	// Needed due to to Sirupsen/sirupsen case clash
	github.com/Sirupsen/logrus => github.com/sirupsen/logrus v1.4.2
	github.com/awslabs/goformation => github.com/errordeveloper/goformation v0.0.0-20190507151947-a31eae35e596
	// Override version since auto-detected one fails with GOPROXY
	github.com/census-instrumentation/opencensus-proto => github.com/census-instrumentation/opencensus-proto v0.2.0
	// go mod appears to pick wrong version of github.com/docker/distribution automatically, which breaks k8s.io/kubernetes@v1.12.6
	github.com/docker/distribution => github.com/docker/distribution v0.0.0-20190619192407-5223c27422cc
	// https://github.com/kubernetes/code-generator/blob/732c9ca86353b432e0cd118b64a941cadff73357/go.mod#L23-L28
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20181025213731-e84da0312774
	golang.org/x/sync => golang.org/x/sync v0.0.0-20181108010431-42b317875d0f
	golang.org/x/sys => golang.org/x/sys v0.0.0-20190209173611-3b5209105503
	golang.org/x/text => golang.org/x/text v0.3.1-0.20181227161524-e6919f6577db
	// Used to pin the k8s library versions regardless of what other dependencies enforce
	k8s.io/api => k8s.io/api v0.0.0-20190226173710-145d52631d00
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190226180157-bd0469a053ff
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190221084156-01f179d85dbc
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190226174127-78295b709ec6
)
