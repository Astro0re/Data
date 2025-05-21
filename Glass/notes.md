Here’s a concise overview of some basic Matplotlib functions in Python to help you get started with creating visualizations:

1. Importing Matplotlib
import matplotlib.pyplot as plt

2. Basic Plotting
Line Plot:
x = [1, 2, 3, 4]
y = [10, 20, 25, 30]
plt.plot(x, y)
plt.title("Line Plot")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.show()

Scatter Plot:
plt.scatter(x, y, color='red')
plt.title("Scatter Plot")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.show()

3. Bar Chart
categories = ['A', 'B', 'C', 'D']
values = [3, 7, 8, 5]
plt.bar(categories, values, color='blue')
plt.title("Bar Chart")
plt.xlabel("Categories")
plt.ylabel("Values")
plt.show()

4. Histogram
data = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
plt.hist(data, bins=4, color='green', edgecolor='black')
plt.title("Histogram")
plt.xlabel("Bins")
plt.ylabel("Frequency")
plt.show()

5. Pie Chart
sizes = [15, 30, 45, 10]
labels = ['A', 'B', 'C', 'D']
plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
plt.title("Pie Chart")
plt.show()

6. Customizing Plots
Adding Grid:
plt.plot(x, y)
plt.grid(True)
plt.show()

Changing Line Style and Color:
plt.plot(x, y, linestyle='--', color='purple', marker='o')
plt.show()

7. Saving a Plot
plt.plot(x, y)
plt.savefig("plot.png")  # Save as PNG
plt.show()


These examples cover the essentials, but Matplotlib is highly versatile, allowing for advanced customizations and integrations. Let me know if you'd like to explore more!