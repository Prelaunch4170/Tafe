from LinkedList_Module import LinkedList
from Queue_Module import Queue
from Stack_Module import Stack
from Product import Product
from Sorting_Metrics import bubbleSort, insertionSort
import collections
import time

products = []


def init():
    file = open('products.txt', 'rt')
    for each_line in file:
        bar_code, name, desc, price = (each_line.strip()).split(',')
        products.append(Product(bar_code, name, desc, float(price)))

    file.close()


def linked_list_demo():
    # linked_list = collections.deque()
    linked_list = LinkedList()
    startTime = time.time()  # gets start time
    for each_product in products:
        linked_list.add_first(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 10000 Product objects to LinkedList is {runTime} milli seconds")


def queue_demo():
    queue = Queue()
    startTime = time.time()  # gets start time
    for each_product in products:
        queue.enqueue(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 10000 Product objects to queue is {runTime} milli seconds")


def bubble_sort_demo():
    startTime = time.time()  # gets start time
    bubbleSort(products)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to sort 10000 Product objects using a Bubble Sort is {runTime} milli seconds")


def stack_demo():
    stack = Stack()
    startTime = time.time()  # gets start time
    for each_product in products:
        stack.push(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 10000 Product objects to stack is {runTime} milli seconds")


def insertion_sort_demo():
    print('Starting insertion sort......')
    startTime = time.time()
    insertionSort(products)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to sort 10000 Product objects using a insertion Sort is {runTime} milli seconds")


def linear_search_demo(bar_code):
    print('Starting linear search......')
    found = False
    startTime = time.time()  # gets start time
    for product in products:
        if product.get_barcode() == bar_code:
            endTime = time.time()
            runTime = float((endTime - startTime))
            print(f"The time to linear search in a  10000 Product objects using a ILinear Search is {runTime} seconds")
            return True
    endTime = time.time()
    runTime = float((endTime - startTime))
    print(f"The time to search a list of  10000 Product objects using a Linear Search is {runTime} seconds")
    return False


def binary_search_demo(x, low, high):
    # Check base case
    arr = products
    startTime = time.time()
    if high >= low:

        mid = (high + low) // 2
        # If element is present at the middle itself
        if int(arr[mid].get_barcode()) == x:
            print("found item here are the details: ", arr[mid])

        # If element is smaller than mid, then it can only
        # be present in left subarray

        elif int(arr[mid].get_barcode()) > x:
            return binary_search_demo(x, low, mid - 1)

        # Else the element can only be present in right subarray
        else:
            return binary_search_demo(x, mid + 1, high)

    else:
        # Element is not present in the array
        print("not found")
    endTime = time.time()
    runTime = float((endTime - startTime)*1000)
    print(f"The time to find the item was {runTime} seconds")


init()

linked_list_demo()
queue_demo()
stack_demo()
print(linear_search_demo('3803'))

insertion_sort_demo()
# bubble_sort_demo()
binary_search_demo(3803, 0, len(products)-1)
