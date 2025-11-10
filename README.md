# Product Funnel Analysis & Revenue Optimization Model

## Executive Summary
This project breaks down how users move through a product funnel; from initial order creation to completion and measures where and why drop-offs happen.  
It’s built to feel like a real client project, combining **PostgreSQL**, **Power BI**, and **Python** to move from raw data → insights → business impact.  
Everything here is based on synthetic data but modeled to look real.

---

## Business Problem
The company noticed that only around **10%** of created orders were being completed.  
The goal was to figure out:
- Which stages lose the most users  
- How performance varies by company  
- How much revenue could grow if we improved stage efficiency by 5–15%

---

## Methodology
### 1. PostgreSQL (Data Modeling)
- Created a database with `orders` and `order_status_log` tables.  
- Defined a clean funnel structure: **Created → Interacted → LoginAttempted → LoginSuccess → Completed**.  
- Calculated the current status and max status level for every order to know exactly where it dropped off.

### 2. Power BI (Visualization & Insights)
- Designed **two pages** in Power BI:
  - **Page 1 – Funnel Dashboard:**  
    - KPI cards: Total Orders (3050), Completed Orders (297), Pull-Through Rate (9.74%)  
    - Funnel visual showing stage progression and drop-offs  
    - Company-level conversion chart (Pull-Through Rate %)  
    - Interactive slicers for date 
       <img width="1303" height="728" alt="image" src="https://github.com/user-attachments/assets/94e31b8f-9165-4c17-99ea-c8c347b143a5" />

  - **Page 2 – Flowchart View:**  
    - Visual flow of how orders move through the funnel  
    - Green boxes for success stages, red boxes for drop-offs  
    - All counts and percentages displayed on the page
      <img width="1282" height="717" alt="image" src="https://github.com/user-attachments/assets/fda7d309-3b6c-4686-b477-990dc2f07e8e" />


  

### 3. Python (Revenue Simulation)
- Built a standalone notebook(attached) to estimate how much revenue could increase with small funnel improvements.  
- Simulated +5%, +10%, and +15% efficiency boosts across stages.  
- Visualized projected daily revenue lift with clear tables and charts.

  
  <img width="788" height="470" alt="image" src="https://github.com/user-attachments/assets/d04753c2-e557-4278-8d3d-d26dd111f38b" />


---

## Results & Business Takeaways

| Metric | Baseline | +10% Efficiency | +15% Efficiency |
|---------|-----------|----------------|----------------|
| Completed Orders | 297 | 337 | 351 |
| Daily Revenue ($) | 14,850 | 16,875 | 18,000 |
| Revenue Gain ($) | – | +2,025 | +3,150 |

- Even a **10% improvement** in funnel efficiency brings **+$2K/day** in extra revenue (~$60K/month).  
- The biggest friction happens between **LoginSuccess → Completed** — fixing that has the most upside.  
- Top-performing companies (C002, C005) can serve as benchmarks for others.

---

## Key Metrics
| KPI | Description | Value |
|------|--------------|--------|
| Total Orders | Total created orders | 3050 |
| Completed Orders | Orders that reached final stage | 297 |
| Pull-Through Rate | Completed / Total | 9.74% |
| Avg Revenue per Order | Business assumption | $50 |

---

## Tools Used
- **PostgreSQL** – data modeling and ETL  
- **Power BI** – dashboarding and visualization  
- **Python (Pandas, Matplotlib)** – simulation and business impact modeling  
- **VS Code ** – for scripting and notebooks  

---


---

## Insights
- Funnel completion rate sits at **~9.7%**, but small stage improvements have a massive ROI.  
- **LoginSuccess → Completed** is the biggest leak.  
- **C002** and **C005** consistently outperform others in conversion rate.  
- Fixing UX or process bottlenecks in the final stage could add **+$3K/day** in revenue.

---

## Next Steps
- Add user-level tracking to study exact causes of drop-offs.  
- Test small UX improvements through A/B experiments.  
- Extend Python model into a simple forecasting engine for month-on-month impact.  
- Train Clients and Users
---

### Author
**Adheesh Ghotikar**  
Data Analytics & Business Intelligence  

