from openpyxl import Workbook
from openpyxl.chart import BarChart, Reference

wb = Workbook()
sheet1 = wb.active
rows = [["product", "online", "Store"],
        [1, 30, 45],
        [2, 45, 16],
        [3, 50, 32],
        [4, 16, 32],
        [5, 56, 16],
        [6, 14, 12],
        [7, 34, 32]]
for row in rows:
    sheet1.append(row)

wb.save("wordbook2.xlsx")

chart1 = BarChart()
