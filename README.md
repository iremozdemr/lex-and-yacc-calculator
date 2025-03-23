# Simple Calculator using Lex & Yacc

**Important Notes:**
- Bonus features (floating-point support & exponentiation) are implemented!
- The exponentiation operator ^ is used instead of **
- byacc is used instead of yacc 
(I initially attempted to use yacc, but I encountered issues on my system. To resolve this, I used byacc, which should work similarly without affecting the functionality of the program.)

---

This project implements a simple arithmetic calculator using **Lex** and **Yacc**. The calculator supports **floating-point numbers**, **basic arithmetic operations**, and **parentheses for grouping expressions**.

## **Features**
- Supports **integer and floating-point arithmetic** (e.g., `3 + 5`, `2.5 * 4.2`).
- Handles **addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), and exponentiation (`^`)**.
- **Divides by zero handling** to prevent runtime errors.
- **Formats output correctly:**
  - **Integer results** are displayed as integers (e.g., `2 + 2` → `result is: 4`).
  - **Floating-point results** are displayed with decimals (e.g., `5 / 2` → `result is: 2.500000`).

---

## **Project Structure**
```
calculator-project
 ├── calculator.l  # Lex file for tokenizing input
 ├── calculator.y  # Yacc file for parsing and evaluating expressions
 ├── README.md     # Documentation file (this file)
```

---

## **Implementation Details**
### **Lex File (`calculator.l`)**
- Tokenizes **numbers (integers and floating points)**.
- Recognizes **arithmetic operators (`+`, `-`, `*`, `/`, `^`)**.
- Handles **parentheses (`(`, `)`)**.
- Ignores **whitespace and newlines**.

### **Yacc File (`calculator.y`)**
- Defines **grammar rules for arithmetic expressions**.
- Uses `%left` and `%right` **operator precedence** to resolve ambiguity.
- Implements **division-by-zero error handling**.
- **Formats output**:
  - If the result is an integer, it is printed **without decimals**.
  - If the result is a floating-point number, it is printed **with decimals**.

---

## **How to Compile & Run**
### **Step 1: Install Dependencies**
Ensure you have **Lex (flex) and Yacc (bison or byacc) installed**.

- **Ubuntu/Linux:**
  ```bash
  sudo apt install flex bison
  ```
- **MacOS (using Homebrew):**
  ```bash
  brew install flex bison
  ```

### **Step 2: Compile the Code**
Run the following commands **inside the project folder**:
```bash
byacc -d calculator.y  # Generate Yacc parser
lex calculator.l       # Generate Lex scanner
gcc lex.yy.c y.tab.c -o calculator -lm  # Compile the final executable
```

### **Step 3: Run the Calculator**
```bash
./calculator
```
This will start the calculator, allowing you to input arithmetic expressions.

---

## **Usage Examples**
| **Input**  | **Output**  |
|------------|------------|
| `3 + 5`    | `result is: 8` |
| `10 * 4`   | `result is: 40` |
| `5 / 2`    | `result is: 2.500000` |
| `4.5 + 1.5` | `result is: 6.000000` |
| `(1 + 2) * 4` | `result is: 12` |
| `3 ^ 2`    | `result is: 9.000000` |
| `10 / 0`   | `division by zero error` |

---

## **Error Handling**
- **Division by zero**:
  ```bash
  10 / 0
  division by zero error
  ```
- **Invalid characters**:
  ```bash
  5 $ 3
  syntax error: unexpected token '$'
  ```
- **Mismatched parentheses**:
  ```bash
  (3 + 5 * 2
  syntax error: missing ')'
  ```

---

## **Design Decisions**
- **Floating-point support** was added using `atof()` in **Lex**.
- **Operator precedence** was implemented to ensure correct evaluation order.
- **Output formatting ensures integers are printed without `.00`**.

---

### **Error: `division by zero error`**
This is expected when dividing by zero. The program correctly prevents crashes.

---

## **Author**
- **Name:** [İrem Özdemir]
- **Email:** [irem.ozdemir@etu.edu.tr]
- **University:** [Your University]
- **Course:** [BİL395]