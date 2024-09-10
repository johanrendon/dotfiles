import os
from pathlib import Path
from typing import Dict, List, Tuple

import toml


def init_config(
    alacritty_path: Path, main_path: Path
) -> Tuple[Dict[str, int], List[str]]:
    """Initializes the configuration for the application.

    Args:
        alacritty_path (Path): The path to the Alacritty configuration directory.
        main_path (Path): The path to the main configuration file.

    Returns:
        Tuple[Dict[str, int], List[str]]: A tuple containing the main configuration dictionary and a list of available themes.
    """
    with open(main_path, "r") as file:
        main_config = toml.load(file)

    themes = os.listdir(alacritty_path / "colorschemes")

    return (main_config, themes)

