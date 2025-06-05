# Crypto Wallet

O **Crypto Wallet** é um aplicativo Flutter voltado para consulta de cotações e
acompanhamento do mercado de criptomoedas. Com ele é possível visualizar
variações de preço, obter gráficos e organizar sua carteira de forma simples.

## Objetivo

Centralizar em um único aplicativo informações sobre diversas moedas
digitais, permitindo que o usuário acompanhe o valor dos ativos de maneira
rápida e intuitiva.

## Como construir

1. Instale as dependências do projeto:

   ```bash
   flutter pub get
   ```

2. Gere os recursos do *splash screen* (opcional):

   ```bash
   flutter pub run flutter_native_splash:create
   ```

3. Para compilar o aplicativo para Android ou iOS, utilize:

   ```bash
   flutter build apk   # ou flutter build ios
   ```

## Como executar

Execute o aplicativo em um dispositivo físico ou emulador com o comando:

```bash
flutter run
```

O aplicativo será iniciado e você poderá navegar pelas telas de boas-vindas,
lista de criptomoedas e compra de ativos.
