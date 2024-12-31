# YaFuture

### **Krok 1: Utworzenie aplikacji i generowanie tokenów API**

Aby móc używać API w projekcie, musisz stworzyć aplikację w systemie, który udostępnia takie usługi (np. GitHub, Google Cloud, Semantic Scholar, itp.).
W zależności od usługi proces może się nieco różnić, ale ogólne kroki są zazwyczaj podobne.

1. **Wejdź na stronę deweloperską usługi**, której API chcesz używać (np. GitHub, Google Cloud, Semantic Scholar).
2. **Zaloguj się** na swoje konto lub utwórz nowe, jeśli jeszcze go nie masz.
3. **Stwórz nową aplikację** lub projekt w panelu deweloperskim. Często nazywa się to „Create New App” lub „Create New Project”.
4. **Wybierz odpowiedni dostęp** – dla aplikacji, która ma korzystać z API, należy zazwyczaj wybrać uprawnienia dostępu, takie jak "Read", "Write", "Admin" (zależnie od potrzeb Twojej aplikacji).
5. **Generowanie klucza API (API Token)** – po stworzeniu aplikacji, powinno pojawić się okno z generowaniem tokenu lub klucza API. Zapisz go, ponieważ będzie potrzebny do autentykacji.

### **Krok 2: Bezpieczne przechowywanie tokenów i kluczy**

Tokeny API są bardzo wrażliwe, dlatego ważne jest, aby przechowywać je w sposób bezpieczny. Oto kilka sposobów:

- **Plik .env (Environment Variables)**: W projekcie możesz przechowywać klucze API w pliku `.env`, który będzie ignorowany przez system kontroli wersji (np. Git). Dzięki temu nie wyciekają one do repozytorium.
  
  Przykład zawartości pliku `.env`:
  ```env
  API_KEY=your_api_key_here
  ```

- **Korzystanie z menedżera haseł**: Możesz używać aplikacji do przechowywania haseł (np. 1Password, Bitwarden) do bezpiecznego przechowywania i zarządzania swoimi kluczami API.

### **Krok 3: Konfiguracja aplikacji z użyciem kluczy API**

Aby Twoja aplikacja mogła korzystać z API, musisz skonfigurować ją tak, aby wiedziała, jak używać klucza API. Możesz to zrobić, dodając klucz API do nagłówków żądań HTTP, które Twoja aplikacja wysyła do serwera API.

#### W przykładzie JavaScript (Node.js) wygląda to tak:

```javascript
const axios = require('axios');

// Pobranie tokena z pliku .env
require('dotenv').config();
const API_KEY = process.env.API_KEY;

axios.get('https://api.example.com/data', {
    headers: {
        'Authorization': `Bearer ${API_KEY}`
    }
})
.then(response => {
    console.log(response.data);
})
.catch(error => {
    console.error('Error:', error);
});
```

- Używamy tutaj `axios` (biblioteka do wysyłania zapytań HTTP) i przekazujemy token API w nagłówku autentykacji.

### **Krok 4: Ustawienie środowiska deweloperskiego**

Jeśli chcesz wygodnie pracować z API w lokalnym środowisku, dobrze jest przygotować odpowiednią konfigurację.

1. **Zainstalowanie wymaganych narzędzi**:
   - Jeśli używasz Pythona, zainstaluj bibliotekę do obsługi HTTP, np. `requests`:
     ```bash
     pip install requests
     ```

2. **Konfiguracja aplikacji**: Upewnij się, że Twoja aplikacja może pobierać dane z API i przetwarzać odpowiedzi. Możesz użyć takich narzędzi jak **Postman** lub **Insomnia** do testowania API, zanim zaimplementujesz kod.

### **Krok 5: Testowanie API**

Przed wdrożeniem aplikacji, przetestuj jej działanie:

1. **Testowanie z Postman**: Postman to narzędzie, które pozwala łatwo wysyłać zapytania do API i analizować odpowiedzi. W Postmanie możesz dodać token API w sekcji "Authorization" i wysłać zapytanie.
   
2. **Testowanie lokalnie**: Możesz także przetestować aplikację lokalnie, korzystając z takich narzędzi jak terminal, aby upewnić się, że aplikacja poprawnie komunikuje się z API.

### **Krok 6: Automatyzacja i CI/CD**

Jeśli chcesz zautomatyzować proces budowy i testowania aplikacji, warto skonfigurować **CI/CD** (Continuous Integration/Continuous Deployment). W tym przypadku wykorzystasz systemy takie jak GitHub Actions, Jenkins, CircleCI.

1. **Utwórz plik konfiguracyjny dla GitHub Actions** (`.github/workflows/ci.yml`):
   - Przykład dla Node.js:
   ```yaml
   name: Node.js CI

   on:
     push:
       branches: [main]

   jobs:
     build:
       runs-on: ubuntu-latest

       steps:
         - uses: actions/checkout@v3
         - name: Set up Node.js
           uses: actions/setup-node@v3
           with:
             node-version: '16'

         - name: Install dependencies
           run: npm install

         - name: Run tests
           run: npm test
   ```

2. **Dodanie tokenu API do GitHub Secrets**: W sekcji "Secrets" repozytorium GitHub dodaj klucz API jako `API_KEY` i użyj go w skryptach CI/CD, aby nie ujawniać go publicznie.

### **Krok 7: Bezpieczne korzystanie z API w produkcji**

W środowisku produkcyjnym bardzo ważne jest, aby:
1. Używać zmiennych środowiskowych do przechowywania wrażliwych danych.
2. Ograniczyć zakres dostępu API – np. poprzez ustalenie uprawnień do tylko odczytu, jeśli nie musisz edytować danych.
3. Monitorować wykorzystanie API, aby wykrywać nietypowe zachowanie, które może wskazywać na nadużycie klucza.

### **Podsumowanie**

Zacząłeś od stworzenia aplikacji w panelu deweloperskim, generowania tokenów API i konfiguracji aplikacji. Klucze API są przechowywane w bezpieczny sposób (np. w pliku `.env`). Zastosowanie tokenów API w aplikacji i testowanie komunikacji z API pozwala na integrację danych z Twoim projektem. Pamiętaj o dobrych praktykach bezpieczeństwa, szczególnie w środowisku produkcyjnym.

Czy masz pytania lub chciałbyś bardziej szczegółowo omówić któryś z kroków?
