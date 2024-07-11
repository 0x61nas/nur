{ lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "ducker";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "robertpsoane";
    repo = "ducker";
    rev = "v${version}";
    hash = "sha256-a1lLuck6DN1JaWSlBo2hcvAUL9wgrv2uBDjNp1YIvF8=";
  };

  cargoHash = "sha256-9NZWZxBDetZ32xBSeV64PstoOK2zpzsuV2ADHw7QlMQ=";

  # There is no tests
  doCheck = false;

  meta = {
    description = "A terminal app for managing docker containers, inspired by K9s";
    homepage = "https://github.com/robertpsoane/ducker";
    changelog = "https://github.com/robertpsoane/ducker/releases/tag/v${version}";
    license = lib.licenses.mit;
    mainProgram = "ducker";
    maintainers = with lib.maintainers; [ anas ];
    platforms = with lib.platforms; unix ++ windows;
  };
}
