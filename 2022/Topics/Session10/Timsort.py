import random
import time

st = time.time()

arr = []
for i in range(10000000):
    num = random.randint(0, 100000000)
    arr.append(num)

arr = arr.sort()
et = time.time()

print(et - st)