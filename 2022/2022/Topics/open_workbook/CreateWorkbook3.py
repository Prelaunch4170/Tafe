from openpyxl import Workbook
from openpyxl.chart import BarChart, Reference
import os

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
data1 = Reference(worksheet=sheet1,
                  min_row= 1,
                  max_row= 8,
                  min_col= 2,
                  max_col=3)
chart1.add_data(data1, titles_from_data=True)
chart1.x_axis.title = "product"
chart1.y_axis.title = "sales"

sheet1.add_chart(chart1, "A10")
wb.save("chart1.xlsx")
os.system(r"chart1.xlsx")