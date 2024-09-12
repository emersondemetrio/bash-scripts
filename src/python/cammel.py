import sys
w = sys.argv[1]
# example
# w = 'hello_world'
# w = 'hello-world'
# w = 'hello world'
# result = 'helloWorld'

detected_split = '-' if '-' in w else '_' if '_' in w else ' '

words = w.split(detected_split)

result = [
    word.capitalize() if i > 0 else word for i, word in enumerate(words)
]

print(''.join(result))
