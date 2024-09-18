import sys
args = sys.argv

# example
# word = 'hello_world'
# word = 'hello-world'
# word = 'hello world'
# result = 'helloWorld'

word_list = sys.argv[1:]

def camelize(word):
    detected_split = '-' if '-' in word else '_' if '_' in word else ' '

    word = word.split(detected_split)

    result = [
        word.capitalize() if i > 0 else word for i, word in enumerate(word)
    ]

    return ''.join(result)

for word in word_list:
    print(camelize(word))

