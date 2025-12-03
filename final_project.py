import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


def load_data():
    url = "https://data.cdc.gov/resource/bi63-dtpu.csv?$limit=500000"
    print("Loading CDC dataset...")
    df = pd.read_csv(url)
    print("Loaded. Columns:", df.columns.tolist())
    return df

def clean_data(df):

    df = df.rename(columns={
        'year': 'Year',
        'state': 'State',
        'cause_name': 'Cause Name',
        'deaths': 'Deaths',
        'aadr': 'Age Adjusted Rate'
    })

    df = df[['Year', 'State', 'Cause Name', 'Deaths', 'Age Adjusted Rate']]
    df = df.dropna()
    df['Year'] = df['Year'].astype(int)

    return df

# Trend Line
def plot_trend(df):
    plt.figure(figsize=(12, 6))
    sns.lineplot(data=df, x='Year', y='Age Adjusted Rate', ci=None)
    plt.title("U.S. Trend of Age-Adjusted Death Rates (1999–2017)")
    plt.savefig("trend_us_age_adjusted_rate.png")
    plt.close()
    print("Saved: trend_us_age_adjusted_rate.png")


# Top 10 Causes of Death
def plot_top_causes(df):
    cause_totals = (
        df.groupby("Cause Name")["Deaths"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
    )

    plt.figure(figsize=(12, 6))
    sns.barplot(x=cause_totals.values, y=cause_totals.index)
    plt.title("Top 10 Causes of Death in the U.S.")
    plt.xlabel("Total Deaths")
    plt.savefig("top_10_causes.png")
    plt.close()


# Age Distribution
def plot_distribution(df):
    plt.figure(figsize=(10, 6))
    sns.histplot(df['Age Adjusted Rate'], bins=30, kde=True)
    plt.title("Distribution of Age-Adjusted Death Rates")
    plt.savefig("distribution_age_adjusted_rate.png")
    plt.close()


# Florida Heart Disease
def plot_state_trend(df, state="Florida", cause="Heart disease"):
    subset = df[(df['State'] == state) & (df['Cause Name'] == cause)]

    plt.figure(figsize=(12, 6))
    sns.lineplot(data=subset, x='Year', y='Age Adjusted Rate')
    plt.title(f"{cause} Mortality Trend in {state}")
    plt.savefig("state_trend_florida_heart_disease.png")
    plt.close()


# Heatmap
def plot_heatmap(df):
    pivot = df.pivot_table(
        index='Cause Name',
        columns='Year',
        values='Age Adjusted Rate',
        aggfunc='mean'
    )

    plt.figure(figsize=(16, 8))
    sns.heatmap(pivot, cmap="viridis")
    plt.title("Heatmap: Cause of Death vs Year (Avg Age-Adjusted Rate)")
    plt.savefig("heatmap_cause_vs_year.png")
    plt.close()


def main():
    df_raw = load_data()
    df = clean_data(df_raw)

    plot_trend(df)
    plot_top_causes(df)
    plot_distribution(df)
    plot_state_trend(df)
    plot_heatmap(df)


if __name__ == "__main__":
    main()