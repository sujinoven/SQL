# Python Learning

A collection of Python practice notebooks, chapter-wise exercises, and data analysis projects documenting my learning journey toward AI and Machine Learning.

The repository covers Python fundamentals, data structures, object-oriented programming, data cleaning, and visualization through practical examples.

## Topics Covered

- **Python fundamentals:** strings, conditions, loops, functions, user input, and exception handling.
- **Data structures:** lists, tuples, sets, dictionaries, and their common methods.
- **Functional programming:** list comprehensions, lambda expressions, `map()`, `filter()`, and `reduce()`.
- **Data analysis:** Pandas DataFrames, filtering, sorting, missing values, duplicates, grouping, pivot tables, cross-tabulation, concatenation, and merges.
- **Data visualization:** Matplotlib and Seaborn charts, including histograms, bar charts, scatter plots, box plots, pair plots, and heatmaps.
- **Object-oriented programming:** classes, objects, constructors, encapsulation, inheritance, abstraction, and polymorphism.
- **Python modules:** creating and importing a custom arithmetic module.

## Repository Guide

| Location                                       | Contents                                                                                        |
| ---------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `Practice/Python_basics.ipynb`                 | Number-guessing examples using loops, conditions, functions, and error handling                 |
| `Practice/Python_Coding_Questions_Part1.ipynb` | Short coding exercises involving strings, lists, dictionaries, and DataFrames                   |
| `Practice/Python_For_DataAnalysis/`            | Pandas practice with restaurant orders, football statistics, and employee data                  |
| `Practice/Advanced_Data_Analysis_WithPython/`  | Insurance and sales data exercises using grouping, aggregation, pivot tables, and concatenation |
| `Practice/Data Visualization/`                 | Introductory and intermediate visualization notebooks using `mtcars.csv` and sample data        |
| `Practice/OOPS/`                               | OOP examples, `Math_Module.py`, and a notebook demonstrating module imports                     |
| `Tasks/Python_Chapter1/`                       | String methods, control flow, functions, Rock–Paper–Scissors, and a word-guessing game          |
| `Tasks/Python_Chapter2/`                       | Data structure methods and creating DataFrames from dictionaries                                |
| `Tasks/Python_Chapter4/`                       | Python and Pandas exercises, sales data cleaning, joins, and functional programming             |
| `Tasks/Python_Chapter5/`                       | Superstore analysis notebook, dataset, task sheet, and presentation                             |
| `Tasks/Python_Chapter6/`                       | OOP exercises using delivery-vehicle examples                                                   |

## Featured Work

### Superstore Data Analysis

[View the notebook](Tasks/Python_Chapter5/Superstore_Project.ipynb)

An exploratory data analysis exercise using retail transaction data. The notebook includes data inspection, missing-value checks, date conversion, grouped summaries, and visualizations.

It explores:

- Sales and profit by product category.
- Sales across regions.
- The top 10 states and products by sales.
- Sales contribution by customer segment.

Supporting files include `Superstore.csv` and `SUPERSTORE DATA ANALYSIS.pptx`.

### Interactive Python Games

- **Number Guessing:** practice loops, conditional feedback, random numbers, and input handling in `Practice/Python_basics.ipynb`.
- **Rock–Paper–Scissors:** play against the computer in `Tasks/Python_Chapter1/Task_3.ipynb`.
- **Word Guessing:** guess letters in a hidden word with limited wrong attempts in `Tasks/Python_Chapter1/Task_4.ipynb`.

### Object-Oriented Programming Practice

The OOP notebooks use bank-account, vehicle, and delivery examples to demonstrate classes, encapsulation, inheritance, abstraction, and polymorphism.

`Math_Module.py` provides addition, subtraction, multiplication, and division functions, with usage examples in `import_math_module.ipynb`.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/sujinoven/Python_Learning.git
cd Python_Learning
```

Alternatively, download and extract the repository ZIP from GitHub.

### 2. Install the notebook tools and libraries

Use Python 3, preferably in a virtual environment:

```bash
python -m pip install notebook pandas numpy matplotlib seaborn
```

The repository does not currently include a pinned dependency file.

### 3. Launch Jupyter Notebook

```bash
python -m notebook
```

Open a notebook and run its cells in order. Game notebooks require input while running.

**Dataset paths:** many notebooks read files using relative paths, such as `pd.read_csv("Superstore.csv")`. Keep the supplied folder structure and use the notebook’s folder as the working directory. Keep `Math_Module.py` alongside its import notebook.

## Suggested Learning Order

1. Start with string methods and control-flow exercises in `Tasks/Python_Chapter1/`.
2. Explore the number-guessing notebook and interactive games.
3. Practice data structures and DataFrame creation in `Tasks/Python_Chapter2/`.
4. Work through `Pandas_Crash_Course.ipynb`.
5. Continue with advanced data analysis and Chapter 4 exercises.
6. Explore the visualization notebooks and Superstore project.
7. Study the OOP practice notebooks and Chapter 6 tasks.

## Additional Resources

- `Python_Interview_questions.docx`
- `Python_Recab_Session_ppt.zip`
- Chapter-specific task sheets under `Tasks/`

## Learning Notes

These notebooks are learning exercises and work in progress. Some cells contain unfinished code or errors and may need correction before a complete run. Run them interactively, check the results, and treat debugging as part of the practice.

## Author

Maintained by [S](https://github.com/sujinoven)UJINOVEN as part of an ongoing journey in Python, data analysis, and AI/ML.
