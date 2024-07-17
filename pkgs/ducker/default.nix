{ lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "ducker";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "robertpsoane";
    repo = "ducker";
    rev = "v${version}";
    hash = "sha256-KT76qhAXUV1ShxXD0NVdvIU0RrEimGJt2RRDkqejZ9s=";
  };

  cargoHash = "sha256-Ji0/CPPqlWUyCwt5XO9DeO71TemDxknNZSgQfkO5U98=";

  # There is no tests
  doCheck = false;

  meta = {
    description = "A terminal app for managing docker containers, inspired by K9s";
    homepage = "https://github.com/robertpsoane/ducker";
    changelog = "https://github.com/robertpsoane/ducker/releases/tag/v${version}";
    license = lib.licenses.mit;
    mainProgram = "ducker";
    # maintainers = with lib.maintainers; [ anas ];
    platforms = with lib.platforms; unix ++ windows;
  };
}
