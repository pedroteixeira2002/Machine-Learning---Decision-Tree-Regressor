import tkinter as tk
from tkinter import ttk
from pyswip import Prolog

# Initialize Prolog
prolog = Prolog()
prolog.consult("docs/tree.pl")


def get_predicted_salary():
    experience_level = experience_var.get()
    company_size = company_size_var.get()
    job_title = job_title_var.get()
    remote_ratio = float(remote_ratio_var.get())
    employment_type = employment_type_var.get()

    query = (f"predict_salary('{experience_level}', {company_size}, '{job_title}', {remote_ratio}, '{employment_type}',"
             f"Salary)")
    results = list(prolog.query(query))

    if results:
        predicted_salary = results[0]['Salary']
        result_label.config(text=f"Predicted Salary: ${predicted_salary}")
    else:
        result_label.config(text="No prediction available")


# Create the main window
root = tk.Tk()
root.title("Salary Prediction Expert System")

# Experience Level
tk.Label(root, text="Experience Level").grid(row=0, column=0, padx=10, pady=10)
experience_var = tk.StringVar()
experience_entry = ttk.Combobox(root, textvariable=experience_var, values=["SE", "EN", "MI", "EX"])
experience_entry.grid(row=0, column=1, padx=10, pady=10)

# Company Size
tk.Label(root, text="Company Size").grid(row=1, column=0, padx=10, pady=10)
company_size_var = tk.StringVar()
company_size_entry = ttk.Combobox(root, textvariable=company_size_var, values=["small", "medium", "large"])
company_size_entry.grid(row=1, column=1, padx=10, pady=10)

# Job Title
tk.Label(root, text="Job Title").grid(row=2, column=0, padx=10, pady=10)
job_title_var = tk.StringVar()
job_title_entry = ttk.Combobox(root, textvariable=job_title_var,
                               values=["Machine Learning Engineer", "Data Scientist", "Data Engineer", "Data Analyst"])
job_title_entry.grid(row=2, column=1, padx=10, pady=10)

# Remote Ratio
tk.Label(root, text="Remote Ratio").grid(row=3, column=0, padx=10, pady=10)
remote_ratio_var = tk.StringVar()
remote_ratio_entry = tk.Entry(root, textvariable=remote_ratio_var)
remote_ratio_entry.grid(row=3, column=1, padx=10, pady=10)

# Employment Type
tk.Label(root, text="Employment Type").grid(row=4, column=0, padx=10, pady=10)
employment_type_var = tk.StringVar()
employment_type_entry = ttk.Combobox(root, textvariable=employment_type_var, values=["PT", "FT", "CT", "FL"])
employment_type_entry.grid(row=4, column=1, padx=10, pady=10)

# Predict Button
predict_button = tk.Button(root, text="Predict Salary", command=get_predicted_salary)
predict_button.grid(row=5, column=0, columnspan=2, padx=10, pady=10)

# Result Label
result_label = tk.Label(root, text="Predicted Salary: ")
result_label.grid(row=6, column=0, columnspan=2, padx=10, pady=10)

# Run the GUI event loop
root.mainloop()
