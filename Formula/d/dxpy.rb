class Dxpy < Formula
  include Language::Python::Virtualenv

  desc "DNAnexus toolkit utilities and platform API bindings for Python"
  homepage "https://github.com/dnanexus/dx-toolkit"
  url "https://files.pythonhosted.org/packages/9e/39/b371f0e788a323d9c36d58c7a9d2c90e86fcfc6756c05f3a0e8f616ad74e/dxpy-0.373.0.tar.gz"
  sha256 "060fb6d03ea0b76ddf6f5c553a39bb1100bf3dbdcc2761881a8860a8f0cccddd"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "97a1a26e052d5f8f5952939177b7e75b29c3daeccb3df68918324b863c1cf77c"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "74f53bf2f6aaf0abd9eadcb4ef8434e1d7d61fc49c7a3831d07847b4bf825258"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0ef752125a4aa8451d02d2320961cda8f0195767a6fff48689086771ab288a95"
    sha256 cellar: :any_skip_relocation, sonoma:         "58d81f8db207e438fd070caa65d0c03416814897ddc0dc7b2d3d235b767c1b12"
    sha256 cellar: :any_skip_relocation, ventura:        "61e1c7792ee0e431b072669b23ca5b0ba17ddbd6a6d2248440fcdfdcf3b384f0"
    sha256 cellar: :any_skip_relocation, monterey:       "fa2080ddf432b72d29456603d51c1118cc3a94c16df1ffcf57c9b28ebde7fbca"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7b28f3944bf1ebddaee5dfb9a7352668e6c7d6f10f3df3eca15975c2975c61b8"
  end

  depends_on "certifi"
  depends_on "cryptography"
  depends_on "python@3.12"

  uses_from_macos "libffi"

  on_macos do
    depends_on "readline"
  end

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/79/51/fd6e293a64ab6f8ce1243cf3273ded7c51cbc33ef552dce3582b6a15d587/argcomplete-3.3.0.tar.gz"
    sha256 "fd03ff4a5b9e6580569d34b273f741e85cd9e072f3feeeee3eba4891c70eda62"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-5.9.8.tar.gz"
    sha256 "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/36/dd/a6b232f449e1bc71802a5b7950dc3675d32c6dbc2a1bd6d71f065551adb6/urllib3-2.1.0.tar.gz"
    sha256 "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54"
  end

  resource "websocket-client" do
    url "https://files.pythonhosted.org/packages/35/d4/14e446a82bc9172d088ebd81c0b02c5ca8481bfeecb13c9ef07998f9249b/websocket_client-0.54.0.tar.gz"
    sha256 "e51562c91ddb8148e791f0155fdb01325d99bb52c4cdbb291aee7a3563fd0849"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    dxenv = <<~EOS
      API server protocol	https
      API server host		api.dnanexus.com
      API server port		443
      Current workspace	None
      Current folder		None
      Current user		None
    EOS
    assert_match dxenv, shell_output("#{bin}/dx env")
  end
end
