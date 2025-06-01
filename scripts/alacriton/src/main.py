import subprocess
from pathlib import Path
from typing import Annotated, Optional

import toml
import typer
from config import init_config

alacritty_path: Path = Path.home() / ".config" / "alacritty"
color_path: Path = alacritty_path / "colors.toml"
main_path: Path = alacritty_path / "alacritty.toml"
colorschemes_path: Path = alacritty_path / "colorschemes"


main_config, themes = init_config(alacritty_path=alacritty_path, main_path=main_path)

app = typer.Typer(no_args_is_help=True)


@app.command()
def change_theme(
    theme: Annotated[Optional[str], typer.Argument(help="Theme to apply")] = None,
    show_themes: Annotated[
        bool, typer.Option(help="Show the available themes", is_eager=True)
    ] = False,
    gui: Annotated[
        bool, typer.Option(help="Display an ui to select the themes")
    ] = False,
) -> None:
    """
    Change the alacritty theme.

    Args:
        theme (str, optional): The theme to apply. Defaults to None.
        show_themes (bool, optional): Show the available themes. Defaults to False.
    """

    if show_themes:
        typer.echo("Available themes:")
        for t in themes:
            typer.echo(f" - {t.split('.')[0]}")

    if gui:
        theme = subprocess.run(
            r"fd . {colorschemes_path} --type f '*.toml' | sed 's/\.toml$//' | xargs -n 1 basename | fzf-tmux --reverse -p".format(
                colorschemes_path=colorschemes_path
            ),
            text=True,
            capture_output=True,
            shell=True,
        ).stdout.strip()

    if theme:
        theme = f"{theme.lower()}.toml"
        if theme in themes:
            with open(colorschemes_path / theme) as colorscheme:
                color_config = toml.load(colorscheme)

            with open(alacritty_path / "colors.toml", "w") as file:
                toml.dump(color_config, file)
        else:
            typer.echo(f"The theme {theme} is not in the list")
            raise typer.Exit(code=1)
    else:
        if not show_themes:
            typer.echo(
                "No theme specified. Use --show-themes to list available themes."
            )
            raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
