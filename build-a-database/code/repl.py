import sys
from prompt_toolkit import PromptSession
from prompt_toolkit import print_formatted_text

def repl(database):
    session = PromptSession()
    while True:
        try:
            text = session.prompt(f"YeetDB@{database}> ")
        except KeyboardInterrupt:
            continue  # Control-C pressed. Try again.
        except EOFError:
            break  # Control-D pressed.
        try:
            qe = QueryExecutor(text)
            result, operation, time = qe.run()
        except Exception as error:
            print_formatted_text(f"ERROR: {error}")
        else:
            if result:
                print_formatted_text(result)
            else:
                print_formatted_text(f"{operation} executed in {round(time, 5)} sec")
    print_formatted_text("\nYeet!")

if __name__ == "__main__":
    db = sys.argv[1]
    repl(db)