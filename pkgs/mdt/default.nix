{ lib
, fetchFromGitHub
, rustPlatform
, darwin
, stdenv
}:

rustPlatform.buildRustPackage rec {
  pname = "mdt";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "henriklovhaug";
    repo = "md-tui";
    rev = "v${version}";
    hash = "sha256-3z97MAlkL8TpRuAK9kU7xvH8NuCsVMy7r9j4PADo+CE=";
  };

  cargoHash = "sha256-KPm7Tned7fRnqtZEK3pBcNzwCx+g+tgUqnHpPDoCk6I=";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.CoreServices ];

  # Disable checkPhase, since the project doesn't contain tests
  doCheck = false;

  meta = {
    description = "Markdown renderer in the terminal";
    homepage = "https://github.com/henriklovhaug/md-tui";
    changelog = "https://github.com/henriklovhaug/md-tui/releases/tag/v${version}";
    license = lib.licenses.agpl3Only;
    mainProgram = "mdt";
    maintainers = with lib.maintainers; [ anas ];
    platforms = with lib.platforms; unix ++ windows;
  };
}
