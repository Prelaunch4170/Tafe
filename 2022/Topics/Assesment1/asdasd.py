def english_to_morse(text):
    morse_code = {
        'A': '.-', 'B': '-...',
        'C': '-.-.', 'D': '-..',
        'E': '.', 'F': '..-.',
        'G': '--.', 'H': '....',
        'I': '..', 'J': '.---',
        'K': '-.-', 'L': '.-..',
        'M': '--', 'N': '-.',
        'O': '---', 'P': '.--.',
        'Q': '--.-', 'R': '.-.',
        'S': '...', 'T': '-',
        'U': '..-', 'V': '...-',
        'W': '.--', 'X': '-..-',
        'Y': '-.--', 'Z': '--..'
    }

    output = ''
    for char in text:
        if char.upper() in morse_code:
            output += morse_code[char.upper()] + ' '
        else:
            output += char + ' '

    return output

print(english_to_morse('Hello World'))