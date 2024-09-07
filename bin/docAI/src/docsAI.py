import os
from pathlib import Path
from typing import List, Optional
from typing_extensions import Annotated

import google.generativeai as genai
import typer
from dotenv import load_dotenv
from rich import print

app = typer.Typer(no_args_is_help=True)

load_dotenv()


@app.command()
def document(
    files: Annotated[List[Path], typer.Argument(help="File or files to document")],
    replace: Annotated[
        bool, typer.Option(help="Replace file with the new code with documentation")
    ] = False,
    language: Annotated[
        Optional[str], typer.Option(help="Language for the documentation")
    ] = "english",
):
    """
    Document code files using a generative AI model.

    Args:
        files (List[Path]): List of file paths to document.
        replace (bool, optional): Whether to replace the original files with the documented versions. Defaults to False.
        language (Optional[str], optional): Language for the documentation. Defaults to 'english'.
    """
    model = genai.GenerativeModel(
        model_name="gemini-1.5-flash",
        system_instruction=f"You are a good programmer. Expert at documenting code. You will be passed code that may or may not have documentation. Your job will be to write the documentation for this code inside the code. If the code is in python you are going to put strong typing in it, otherwise you are not going to change the code. Your ourput will be only the code. The documentation will be in {language}",
    )

    handling_files(files=files, replace=replace, model=model)


def handling_files(files: List[Path], replace: bool, model: genai.GenerativeModel):
    """
    Handles the documentation of individual files.

    Args:
        files (List[Path]): List of file paths to document.
        replace (bool): Whether to replace the original files with the documented versions.
        model (genai.GenerativeModel): The generative AI model to use for documentation.
    """

    for file in files:

        if replace:
            output_file: Path = Path(file)

        else:
            output_file: Path = Path(f"doc_{file}")

        try:
            with open(file, "r") as code_file:
                file_content = code_file.read()
                doc_code = model.generate_content(file_content).text
                doc_code = doc_code.splitlines()[1:-1]
                doc_code = "\n".join(doc_code)

            with open(output_file, "w") as out_file:
                out_file.write(doc_code)
                print(f"Documentation for {file} [green]ready :white_check_mark:")

        except FileNotFoundError:
            print(f"The file {file} doesn't exist")
            typer.Exit(code=1)
            break


if __name__ == "__main__":

    load_dotenv("../.env")
    genai.configure(api_key=os.getenv("API_KEY"))

    app()
