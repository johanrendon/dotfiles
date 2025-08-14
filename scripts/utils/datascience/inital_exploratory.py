from itertools import zip_longest
from pathlib import Path
from typing import Annotated, List

import pandas as pd
import typer
from pandas.core.frame import duplicated
from rich.console import Console
from rich.table import Table

app = typer.Typer()


@app.command()
def initial(path: Annotated[Path, typer.Argument(help="Dataset path")]) -> None:
    path = path.resolve()

    dataset = pd.read_csv(path)

    cat_features = dataset.select_dtypes(include="object").columns.to_list()
    num_features = dataset.select_dtypes(exclude="object").columns.to_list()

    nulls = dataset.isna().sum().sum()
    duplicated = dataset.duplicated().sum()

    config_table(cat_features, num_features, nulls, duplicated)


ola: int = "que mas"


def config_table(
    cat_features: List[str],
    num_features: List[str],
    null_number: int,
    duplicated_number: int,
) -> None:
    console = Console()
    features_table = Table(show_header=True, header_style="bold magenta")
    features_table.add_column("Catergorical", style="dim", width=12)
    features_table.add_column("Numerical", style="dim", width=12)

    for cat, num in zip_longest(cat_features, num_features, fillvalue=None):
        features_table.add_row(cat, num)

    nulld_table = Table(show_header=True, header_style="bold magenta")
    nulld_table.add_column("# Null values", style="dim", width=12)
    nulld_table.add_column("# duplicated_ values values", style="dim", width=12)

    nulld_table.add_row(str(null_number), str(duplicated_number))

    console.print(features_table)
    console.print(nulld_table)


if __name__ == "__main__":
    app()
