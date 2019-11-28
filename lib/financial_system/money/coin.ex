defmodule FinancialSystem.Money.Coin do
  @moduledoc """
  Currencies ISO4217
  """

  @coins [
    %{
      name: "UAE Dirham",
      code: "AED",
      num_code: 784,
      multiplier: 2
    },
    %{
      name: "Afghani",
      code: "AFN",
      num_code: 971,
      multiplier: 2
    },
    %{
      name: "Lek",
      code: "ALL",
      num_code: 008,
      multiplier: 2
    },
    %{
      name: "Armenian Dram",
      code: "AMD",
      num_code: 051,
      multiplier: 2
    },
    %{
      name: "Netherlands Antillean Guilder",
      code: "ANG",
      num_code: 532,
      multiplier: 2
    },
    %{
      name: "Kwanza",
      code: "AOA",
      num_code: 973,
      multiplier: 2
    },
    %{
      name: "Argentine Peso",
      code: "ARS",
      num_code: 032,
      multiplier: 2
    },
    %{
      name: "Australian Dollar",
      code: "AUD",
      num_code: 036,
      multiplier: 2
    },
    %{
      name: "Aruban Florin",
      code: "AWG",
      num_code: 533,
      multiplier: 2
    },
    %{
      name: "Azerbaijan Manat",
      code: "AZN",
      num_code: 944,
      multiplier: 2
    },
    %{
      name: "Convertible Mark",
      code: "BAM",
      num_code: 977,
      multiplier: 2
    },
    %{
      name: "Barbados Dollar",
      code: "BBD",
      num_code: 052,
      multiplier: 2
    },
    %{
      name: "Taka",
      code: "BDT",
      num_code: 050,
      multiplier: 2
    },
    %{
      name: "Bulgarian Lev",
      code: "BGN",
      num_code: 975,
      multiplier: 2
    },
    %{
      name: "Bahraini Dinar",
      code: "BHD",
      num_code: 048,
      multiplier: 3
    },
    %{
      name: "Burundi Franc",
      code: "BIF",
      num_code: 108,
      multiplier: 0
    },
    %{
      name: "Bermudian Dollar",
      code: "BMD",
      num_code: 060,
      multiplier: 2
    },
    %{
      name: "Brunei Dollar",
      code: "BND",
      num_code: 096,
      multiplier: 2
    },
    %{
      name: "Boliviano",
      code: "BOB",
      num_code: 068,
      multiplier: 2
    },
    %{
      name: "Mvdol",
      code: "BOV",
      num_code: 984,
      multiplier: 2
    },
    %{
      name: "Brazilian Real",
      code: "BRL",
      num_code: 986,
      multiplier: 2
    },
    %{
      name: "Bahamian Dollar",
      code: "BSD",
      num_code: 044,
      multiplier: 2
    },
    %{
      name: "Ngultrum",
      code: "BTN",
      num_code: 064,
      multiplier: 2
    },
    %{
      name: "Pula",
      code: "BWP",
      num_code: 072,
      multiplier: 2
    },
    %{
      name: "Belarusian Ruble",
      code: "BYN",
      num_code: 933,
      multiplier: 2
    },
    %{
      name: "Belize Dollar",
      code: "BZD",
      num_code: 084,
      multiplier: 2
    },
    %{
      name: "Canadian Dollar",
      code: "CAD",
      num_code: 124,
      multiplier: 2
    },
    %{
      name: "Congolese Franc",
      code: "CDF",
      num_code: 976,
      multiplier: 2
    },
    %{
      name: "WIR Euro",
      code: "CHE",
      num_code: 947,
      multiplier: 2
    },
    %{
      name: "Swiss Franc",
      code: "CHF",
      num_code: 756,
      multiplier: 2
    },
    %{
      name: "WIR Franc",
      code: "CHW",
      num_code: 948,
      multiplier: 2
    },
    %{
      name: "Unidad de Fomento",
      code: "CLF",
      num_code: 990,
      multiplier: 4
    },
    %{
      name: "Chilean Peso",
      code: "CLP",
      num_code: 152,
      multiplier: 0
    },
    %{
      name: "Yuan Renminbi",
      code: "CNY",
      num_code: 156,
      multiplier: 2
    },
    %{
      name: "Colombian Peso",
      code: "COP",
      num_code: 170,
      multiplier: 2
    },
    %{
      name: "Unidad de Valor Real",
      code: "COU",
      num_code: 970,
      multiplier: 2
    },
    %{
      name: "Costa Rican Colon",
      code: "CRC",
      num_code: 188,
      multiplier: 2
    },
    %{
      name: "Peso Convertible",
      code: "CUC",
      num_code: 931,
      multiplier: 2
    },
    %{
      name: "Cuban Peso",
      code: "CUP",
      num_code: 192,
      multiplier: 2
    },
    %{
      name: "Cabo Verde Escudo",
      code: "CVE",
      num_code: 132,
      multiplier: 2
    },
    %{
      name: "Czech Koruna",
      code: "CZK",
      num_code: 203,
      multiplier: 2
    },
    %{
      name: "Djibouti Franc",
      code: "DJF",
      num_code: 262,
      multiplier: 0
    },
    %{
      name: "Danish Krone",
      code: "DKK",
      num_code: 208,
      multiplier: 2
    },
    %{
      name: "Dominican Peso",
      code: "DOP",
      num_code: 214,
      multiplier: 2
    },
    %{
      name: "Algerian Dinar",
      code: "DZD",
      num_code: 012,
      multiplier: 2
    },
    %{
      name: "Egyptian Pound",
      code: "EGP",
      num_code: 818,
      multiplier: 2
    },
    %{
      name: "Nakfa",
      code: "ERN",
      num_code: 232,
      multiplier: 2
    },
    %{
      name: "Ethiopian Birr",
      code: "ETB",
      num_code: 230,
      multiplier: 2
    },
    %{
      name: "Euro",
      code: "EUR",
      num_code: 978,
      multiplier: 2
    },
    %{
      name: "Fiji Dollar",
      code: "FJD",
      num_code: 242,
      multiplier: 2
    },
    %{
      name: "Falkland Islands Pound",
      code: "FKP",
      num_code: 238,
      multiplier: 2
    },
    %{
      name: "Pound Sterling",
      code: "GBP",
      num_code: 826,
      multiplier: 2
    },
    %{
      name: "Lari",
      code: "GEL",
      num_code: 981,
      multiplier: 2
    },
    %{
      name: "Ghana Cedi",
      code: "GHS",
      num_code: 936,
      multiplier: 2
    },
    %{
      name: "Gibraltar Pound",
      code: "GIP",
      num_code: 292,
      multiplier: 2
    },
    %{
      name: "Dalasi",
      code: "GMD",
      num_code: 270,
      multiplier: 2
    },
    %{
      name: "Guinean Franc",
      code: "GNF",
      num_code: 324,
      multiplier: 0
    },
    %{
      name: "Quetzal",
      code: "GTQ",
      num_code: 320,
      multiplier: 2
    },
    %{
      name: "Guyana Dollar",
      code: "GYD",
      num_code: 328,
      multiplier: 2
    },
    %{
      name: "Hong Kong Dollar",
      code: "HKD",
      num_code: 344,
      multiplier: 2
    },
    %{
      name: "Lempira",
      code: "HNL",
      num_code: 340,
      multiplier: 2
    },
    %{
      name: "Kuna",
      code: "HRK",
      num_code: 191,
      multiplier: 2
    },
    %{
      name: "Gourde",
      code: "HTG",
      num_code: 332,
      multiplier: 2
    },
    %{
      name: "Forint",
      code: "HUF",
      num_code: 348,
      multiplier: 2
    },
    %{
      name: "Rupiah",
      code: "IDR",
      num_code: 360,
      multiplier: 2
    },
    %{
      name: "New Israeli Sheqel",
      code: "ILS",
      num_code: 376,
      multiplier: 2
    },
    %{
      name: "Indian Rupee",
      code: "INR",
      num_code: 356,
      multiplier: 2
    },
    %{
      name: "Iraqi Dinar",
      code: "IQD",
      num_code: 368,
      multiplier: 3
    },
    %{
      name: "Iranian Rial",
      code: "IRR",
      num_code: 364,
      multiplier: 2
    },
    %{
      name: "Iceland Krona",
      code: "ISK",
      num_code: 352,
      multiplier: 0
    },
    %{
      name: "Jamaican Dollar",
      code: "JMD",
      num_code: 388,
      multiplier: 2
    },
    %{
      name: "Jordanian Dinar",
      code: "JOD",
      num_code: 400,
      multiplier: 3
    },
    %{
      name: "Yen",
      code: "JPY",
      num_code: 392,
      multiplier: 0
    },
    %{
      name: "Kenyan Shilling",
      code: "KES",
      num_code: 404,
      multiplier: 2
    },
    %{
      name: "Som",
      code: "KGS",
      num_code: 417,
      multiplier: 2
    },
    %{
      name: "Riel",
      code: "KHR",
      num_code: 116,
      multiplier: 2
    },
    %{
      name: "Comorian Franc ",
      code: "KMF",
      num_code: 174,
      multiplier: 0
    },
    %{
      name: "North Korean Won",
      code: "KPW",
      num_code: 408,
      multiplier: 2
    },
    %{
      name: "Won",
      code: "KRW",
      num_code: 410,
      multiplier: 0
    },
    %{
      name: "Kuwaiti Dinar",
      code: "KWD",
      num_code: 414,
      multiplier: 3
    },
    %{
      name: "Cayman Islands Dollar",
      code: "KYD",
      num_code: 136,
      multiplier: 2
    },
    %{
      name: "Tenge",
      code: "KZT",
      num_code: 398,
      multiplier: 2
    },
    %{
      name: "Lao Kip",
      code: "LAK",
      num_code: 418,
      multiplier: 2
    },
    %{
      name: "Lebanese Pound",
      code: "LBP",
      num_code: 422,
      multiplier: 2
    },
    %{
      name: "Sri Lanka Rupee",
      code: "LKR",
      num_code: 144,
      multiplier: 2
    },
    %{
      name: "Liberian Dollar",
      code: "LRD",
      num_code: 430,
      multiplier: 2
    },
    %{
      name: "Loti",
      code: "LSL",
      num_code: 426,
      multiplier: 2
    },
    %{
      name: "Libyan Dinar",
      code: "LYD",
      num_code: 434,
      multiplier: 3
    },
    %{
      name: "Moroccan Dirham",
      code: "MAD",
      num_code: 504,
      multiplier: 2
    },
    %{
      name: "Moldovan Leu",
      code: "MDL",
      num_code: 498,
      multiplier: 2
    },
    %{
      name: "Malagasy Ariary",
      code: "MGA",
      num_code: 969,
      multiplier: 2
    },
    %{
      name: "Denar",
      code: "MKD",
      num_code: 807,
      multiplier: 2
    },
    %{
      name: "Kyat",
      code: "MMK",
      num_code: 104,
      multiplier: 2
    },
    %{
      name: "Tugrik",
      code: "MNT",
      num_code: 496,
      multiplier: 2
    },
    %{
      name: "Pataca",
      code: "MOP",
      num_code: 446,
      multiplier: 2
    },
    %{
      name: "Ouguiya",
      code: "MRU",
      num_code: 929,
      multiplier: 2
    },
    %{
      name: "Mauritius Rupee",
      code: "MUR",
      num_code: 480,
      multiplier: 2
    },
    %{
      name: "Rufiyaa",
      code: "MVR",
      num_code: 462,
      multiplier: 2
    },
    %{
      name: "Malawi Kwacha",
      code: "MWK",
      num_code: 454,
      multiplier: 2
    },
    %{
      name: "Mexican Peso",
      code: "MXN",
      num_code: 484,
      multiplier: 2
    },
    %{
      name: "Mexican Unidad de Inversion (UDI)",
      code: "MXV",
      num_code: 979,
      multiplier: 2
    },
    %{
      name: "Malaysian Ringgit",
      code: "MYR",
      num_code: 458,
      multiplier: 2
    },
    %{
      name: "Mozambique Metical",
      code: "MZN",
      num_code: 943,
      multiplier: 2
    },
    %{
      name: "Namibia Dollar",
      code: "NAD",
      num_code: 516,
      multiplier: 2
    },
    %{
      name: "Naira",
      code: "NGN",
      num_code: 566,
      multiplier: 2
    },
    %{
      name: "Cordoba Oro",
      code: "NIO",
      num_code: 558,
      multiplier: 2
    },
    %{
      name: "Norwegian Krone",
      code: "NOK",
      num_code: 578,
      multiplier: 2
    },
    %{
      name: "Nepalese Rupee",
      code: "NPR",
      num_code: 524,
      multiplier: 2
    },
    %{
      name: "New Zealand Dollar",
      code: "NZD",
      num_code: 554,
      multiplier: 2
    },
    %{
      name: "Rial Omani",
      code: "OMR",
      num_code: 512,
      multiplier: 3
    },
    %{
      name: "Balboa",
      code: "PAB",
      num_code: 590,
      multiplier: 2
    },
    %{
      name: "Sol",
      code: "PEN",
      num_code: 604,
      multiplier: 2
    },
    %{
      name: "Kina",
      code: "PGK",
      num_code: 598,
      multiplier: 2
    },
    %{
      name: "Philippine Piso",
      code: "PHP",
      num_code: 608,
      multiplier: 2
    },
    %{
      name: "Pakistan Rupee",
      code: "PKR",
      num_code: 586,
      multiplier: 2
    },
    %{
      name: "Zloty",
      code: "PLN",
      num_code: 985,
      multiplier: 2
    },
    %{
      name: "Guarani",
      code: "PYG",
      num_code: 600,
      multiplier: 0
    },
    %{
      name: "Qatari Rial",
      code: "QAR",
      num_code: 634,
      multiplier: 2
    },
    %{
      name: "Romanian Leu",
      code: "RON",
      num_code: 946,
      multiplier: 2
    },
    %{
      name: "Serbian Dinar",
      code: "RSD",
      num_code: 941,
      multiplier: 2
    },
    %{
      name: "Russian Ruble",
      code: "RUB",
      num_code: 643,
      multiplier: 2
    },
    %{
      name: "Rwanda Franc",
      code: "RWF",
      num_code: 646,
      multiplier: 0
    },
    %{
      name: "Saudi Riyal",
      code: "SAR",
      num_code: 682,
      multiplier: 2
    },
    %{
      name: "Solomon Islands Dollar",
      code: "SBD",
      num_code: 090,
      multiplier: 2
    },
    %{
      name: "Seychelles Rupee",
      code: "SCR",
      num_code: 690,
      multiplier: 2
    },
    %{
      name: "Sudanese Pound",
      code: "SDG",
      num_code: 938,
      multiplier: 2
    },
    %{
      name: "Swedish Krona",
      code: "SEK",
      num_code: 752,
      multiplier: 2
    },
    %{
      name: "Singapore Dollar",
      code: "SGD",
      num_code: 702,
      multiplier: 2
    },
    %{
      name: "Saint Helena Pound",
      code: "SHP",
      num_code: 654,
      multiplier: 2
    },
    %{
      name: "Leone",
      code: "SLL",
      num_code: 694,
      multiplier: 2
    },
    %{
      name: "Somali Shilling",
      code: "SOS",
      num_code: 706,
      multiplier: 2
    },
    %{
      name: "Surinam Dollar",
      code: "SRD",
      num_code: 968,
      multiplier: 2
    },
    %{
      name: "South Sudanese Pound",
      code: "SSP",
      num_code: 728,
      multiplier: 2
    },
    %{
      name: "Dobra",
      code: "STN",
      num_code: 930,
      multiplier: 2
    },
    %{
      name: "El Salvador Colon",
      code: "SVC",
      num_code: 222,
      multiplier: 2
    },
    %{
      name: "Syrian Pound",
      code: "SYP",
      num_code: 760,
      multiplier: 2
    },
    %{
      name: "Lilangeni",
      code: "SZL",
      num_code: 748,
      multiplier: 2
    },
    %{
      name: "Baht",
      code: "THB",
      num_code: 764,
      multiplier: 2
    },
    %{
      name: "Somoni",
      code: "TJS",
      num_code: 972,
      multiplier: 2
    },
    %{
      name: "Turkmenistan New Manat",
      code: "TMT",
      num_code: 934,
      multiplier: 2
    },
    %{
      name: "Tunisian Dinar",
      code: "TND",
      num_code: 788,
      multiplier: 3
    },
    %{
      name: "Pa’anga",
      code: "TOP",
      num_code: 776,
      multiplier: 2
    },
    %{
      name: "Turkish Lira",
      code: "TRY",
      num_code: 949,
      multiplier: 2
    },
    %{
      name: "Trinidad and Tobago Dollar",
      code: "TTD",
      num_code: 780,
      multiplier: 2
    },
    %{
      name: "New Taiwan Dollar",
      code: "TWD",
      num_code: 901,
      multiplier: 2
    },
    %{
      name: "Tanzanian Shilling",
      code: "TZS",
      num_code: 834,
      multiplier: 2
    },
    %{
      name: "Hryvnia",
      code: "UAH",
      num_code: 980,
      multiplier: 2
    },
    %{
      name: "Uganda Shilling",
      code: "UGX",
      num_code: 800,
      multiplier: 0
    },
    %{
      name: "US Dollar",
      code: "USD",
      num_code: 840,
      multiplier: 2
    },
    %{
      name: "US Dollar (Next day)",
      code: "USN",
      num_code: 997,
      multiplier: 2
    },
    %{
      name: "Uruguay Peso en Unidades Indexadas (URUIURUI)",
      code: "UYI",
      num_code: 940,
      multiplier: 0
    },
    %{
      name: "Peso Uruguayo",
      code: "UYU",
      num_code: 858,
      multiplier: 2
    },
    %{
      name: "Uzbekistan Sum",
      code: "UZS",
      num_code: 860,
      multiplier: 2
    },
    %{
      name: "Bolívar",
      code: "VEF",
      num_code: 937,
      multiplier: 2
    },
    %{
      name: "Dong",
      code: "VND",
      num_code: 704,
      multiplier: 0
    },
    %{
      name: "Vatu",
      code: "VUV",
      num_code: 548,
      multiplier: 0
    },
    %{
      name: "Tala",
      code: "WST",
      num_code: 882,
      multiplier: 2
    },
    %{
      name: "CFA Franc BEAC",
      code: "XAF",
      num_code: 950,
      multiplier: 0
    },
    %{
      name: "East Caribbean Dollar",
      code: "XCD",
      num_code: 951,
      multiplier: 2
    },
    %{
      name: "CFA Franc BCEAO",
      code: "XOF",
      num_code: 952,
      multiplier: 0
    },
    %{
      name: "CFP Franc",
      code: "XPF",
      num_code: 953,
      multiplier: 0
    },
    %{
      name: "Yemeni Rial",
      code: "YER",
      num_code: 886,
      multiplier: 2
    },
    %{
      name: "Rand",
      code: "ZAR",
      num_code: 710,
      multiplier: 2
    },
    %{
      name: "Zambian Kwacha",
      code: "ZMW",
      num_code: 967,
      multiplier: 2
    },
    %{
      name: "Zimbabwe Dollar",
      code: "ZWL",
      num_code: 932,
      multiplier: 2
    }
  ]

  @doc """
  Return list of currencies iso 4217

    ##Examples

    iex> get_coins
      [
        %{
          name: "UAE Dirham",
          code: "AED",
          num_code: 784,
          multiplier: 2
        },
        ...
      ]
  """
  def get_coins do
    @coins
  end

  @doc """
  Return currency by code

    ##Examples

      iex> get_by_code(BRL)
      %{
        name: "Brazilian Real",
        code: "BRL",
        num_code: 986,
        multiplier: 2
      }

  """
  def get_by_code(code) do
    @coins |> Enum.find(&(&1.code == code))
  end
end
