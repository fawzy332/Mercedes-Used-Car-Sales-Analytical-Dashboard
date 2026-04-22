Mercedes-Benz Secondary Market & TCO Analysis
📌 Project Overview

The Mercedes-Benz Secondary Market & TCO Analysis is a strategic data tool designed to move beyond simple sales tracking into the realm of predictive vehicle economics. By analyzing over 13,119 unique records, this project calculates the True Cost of Ownership (TCO) by integrating current market prices with forecasted 3-year maintenance burdens.

The dashboard identifies the "Maintenance Cliff"—the critical point where a vehicle's plummeting resale value intersects with rising mechanical repair costs—to provide users with a clear "Buy, Caution, or Avoid" verdict.
🛠️ Technical Architecture
1. Data Modeling (SQL)

The project utilizes a structured relational model created via SQL to unify disparate data into a unified structure.

    Fact Table: Contains 13K+ records of model names, years, and prices.

    Dimension Tables: Includes a "Tier Dimension" (Economy to Ultra-Luxury) and "Maintenance Status Dimension".

    Maintenance Logic: An INSERT INTO script uses a power function to simulate cost growth:

        Years 1-15: Costs grow at 8% annually as parts wear out.

        Years 16-60: Costs stabilize at a high "Classic" preservation rate.

2. Tiered Classification

Models are dynamically categorized to assign accurate depreciation and maintenance multipliers:

    Luxury: S-Class, G-Class, SL-Class, etc..

    Premium: E-Class, GLE, GLC, etc..

    Economy: A-Class, B-Class, CLA, etc..

📊 Dashboard Features

The dashboard follows a "Modern Minimalism" philosophy, utilizing subtle glassmorphism and a monochromatic palette to reduce cognitive load.
Key Visualizations:

    Average Price By Car Age: Captures sharp initial depreciation before price stabilization.

    Maintenance Drag %: A gauge measuring the impact of maintenance on the vehicle’s value against a 20% threshold.

    Economic Viability & Resale Forecast: A 3-year projection showing the gap between declining resale value and increasing cumulative maintenance.

📈 Strategic Market Insights (2026)

    The 10-Year Wall: Repair probability jumps to 41% after year 10.

    EV Erosion: Luxury electrics (EQS/EQE) depreciate at nearly double the rate of ICE models.

    The CPO Sweet Spot: 3-year-old models offer 68% of original value with 80%+ of mechanical life remaining.

🚀 Key Recommendations

    Phase Out Early: Liquidate assets before Year 8 to avoid the "Maintenance Cliff".

    Verify Major Status: For cars in the "Major" category (43%), demand proof of transmission and suspension overhauls.

    Budget for TCO: Allocate for the total ownership cost (avg. $22.95K) rather than just the sticker price.
