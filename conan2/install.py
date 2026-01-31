#!/usr/bin/env python3

from pathlib import Path
import subprocess
import shutil

if __name__ == "__main__":
    # Construct the Conan profiles directory
    conan_profiles_dir: Path = Path(subprocess.run(
        ["conan", "config", "home"],
        capture_output=True,
        text=True,
        check=True
    ).stdout.strip())/"profiles"

    # Make the directory if it doesn't exist
    conan_profiles_dir.mkdir(parents=True, exist_ok=True)

    # Construct the path to the Conan profiles that will be installed
    conan_profiles: Path = Path(__file__).resolve().parent/"profiles"

    # Copy all the profiles locally into the Conan profiles directory
    for conan_profile in conan_profiles.iterdir():
        if conan_profile.is_file():
            shutil.copy2(conan_profile, conan_profiles_dir/conan_profile.name)
            print(f"Installed {conan_profile.name}")
