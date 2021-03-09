from typing import List, Tuple
import os
import logging
import re


def preprocess_raw_text(raw_text: str) -> str:
    out = raw_text.replace("<p>", "").replace("</p>", "")
    return out


def extract_entities(raw_text: str) -> List[str]:
    return [entity[1: -1] for entity in re.findall('\[.*?\]', raw_text)]


def extract_lexicalization(raw_text: str) -> str:
    return raw_text.replace("[", "").replace("]", "")


def run_parser(set_path: str) -> List[Tuple[List[List[str]], List[str]]]:
    logging.info("Parsing files form {}".format(set_path))
    data_files = [file for file in os.listdir(set_path) if os.path.splitext(file)[-1] == ".txt"]
    logging.debug("Detected {} data files".format(len(data_files)))

    entry_set = []

    for file in data_files:

        entities = []
        lexicalizations = []

        with open(os.path.join(set_path, file), "r") as f:
            file_content = f.read()

        clean_content = preprocess_raw_text(file_content)

        sentences = clean_content.split(". ")
        for sentence in sentences:
            entities.append(extract_entities(sentence))
            lexicalizations.append(extract_lexicalization(sentence))

        entry_set.append((entities, lexicalizations))

    return entry_set


# # Testing
#
# # if __name__ == "__main__":
# data_dir = "/Users/micheleb/uniData/corpus_for_michele"
#
# test_raw_text = "my [name] is [pippo] and I am [stupid]."
# extract_entities(test_raw_text)
# extract_lexicalization(test_raw_text)
#
# out = run_parser(data_dir)
