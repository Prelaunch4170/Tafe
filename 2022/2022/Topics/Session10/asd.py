import random
import time

st = time.time()


def insertionSort(alist):
    for index in range(1, len(alist)):

        currentvalue = alist[index]
        position = index

        while position > 0 and alist[position - 1] > currentvalue:
            alist[position] = alist[position - 1]
            position = position - 1
        alist[position] = currentvalue


arr = []
for i in range(10000000):
    num = random.randint(0, 100000000)
    arr.append(num)


insertionSort(arr)

et = time.time()

print(et - st)
