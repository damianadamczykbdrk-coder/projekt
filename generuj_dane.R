# data-raw/generuj_dane.R

# Ustawiamy ziarno losowości
set.seed(123)

# Symulujemy 10 państw i 5 ekspertów oceniających je
mcda_dane_surowe <- data.frame(
  
  # --- Identyfikatory ---
  EkspertID = rep(1:5, each = 10),  # 5 ekspertów
  Panstwo = rep(c("Norwegia","Szwecja","Polska","Niemcy","Hiszpania",
                  "Francja","Kanada","Japonia","Australia","Wlochy"), length.out = 50),
  
  # --- Kryterium 1: Koszt życia (dane liczbowe) ---
  koszt_mieszkanie = runif(50, 500, 2500),   # w USD/miesiąc
  koszt_zywnosc = runif(50, 200, 800),       # w USD/miesiąc
  
  # --- Kryterium 2: Jakość życia (skala 1-5) ---
  zdrowie = sample(1:5, 50, replace = TRUE),
  edukacja = sample(1:5, 50, replace = TRUE),
  komfort = sample(c(1:5, 99), 50, replace = TRUE, prob = c(rep(0.18,5),0.1)),  # 99 = brak danych
  rekreacja = sample(1:5, 50, replace = TRUE),
  
  # --- Kryterium 3: Bezpieczeństwo i infrastruktura (dane mieszane) ---
  przestepczosc = runif(50, 0, 100),   # liczba przestępstw na 100 tys. mieszkańców
  transport = runif(50, 1, 10),       # ocena transportu publicznego 1-10
  internet = sample(0:1, 50, replace = TRUE) * 10, # dostęp do szybkiego internetu 0 lub 10 pkt
  
  # --- Kryterium 4: Środowisko i społeczeństwo (skala 1-7) ---
  czystosc_powietrza = sample(1:7, 50, replace = TRUE),
  zielone_przestrzenie = sample(1:7, 50, replace = TRUE),
  recykling = sample(c(1:7, NA), 50, replace = TRUE),  # NA = brak danych
  spoleczenstwo = sample(1:7, 50, replace = TRUE)
)

# Zapis danych do folderu /data w pakiecie
usethis::use_data(mcda_dane_surowe, overwrite = TRUE)
