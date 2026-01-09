import os
import subprocess
import zipfile
from pathlib import Path
from typing import Annotated, List

import pandas
import typer
from loguru import logger

app = typer.Typer()


@app.command()
def main(
    data_dir: Annotated[Path, typer.Argument(help="Data directory")],
    competition: Annotated[str, typer.Argument(help="Competition to download")],
):
    kaggle_command: List[str | Path] = [
        "kaggle",
        "competitions",
        "download",
        "-c",
        competition,
        "-p",
        data_dir,
    ]

    subprocess.run(kaggle_command)

    data_path: Path = data_dir / f"{competition}.zip"
    logger.info("Download kaggle zip")

    with zipfile.ZipFile(data_path, "r") as zip_data:
        zip_data.extractall(path=data_dir)
        logger.info("Files extracted")

    # .csv
    for file in os.listdir(data_dir):
        if file.split(".")[-1] != "csv":
            os.remove(data_dir / file)


if __name__ == "__main__":
    app()
