# RestApp

**Ferramenta simples para reiniciar aplicativos que apresentam problemas relacionados ao consumo excessivo de memória.**

O **RestApp** foi criado para solucionar uma situação encontrada em um sistema utilizado em uma cafeteria, onde o aplicativo apresentava problemas após permanecer muito tempo em execução devido ao alto consumo de memória.

Em vez de reiniciar o computador inteiro, o RestApp encerra o aplicativo e inicia uma nova instância, permitindo recuperar seu funcionamento rapidamente.

---

## 🔄 Como funciona

O processo é simples:

1. 🛑 Encerra o aplicativo configurado.
2. 🧹 Libera os recursos utilizados pelo processo.
3. 🚀 Inicia o aplicativo novamente.

Dessa forma, é possível recuperar rapidamente o funcionamento do aplicativo sem precisar reiniciar o computador inteiro.

---

## 🎯 Objetivo

O **RestApp não corrige o vazamento de memória** ou outros problemas internos do aplicativo original.

Ele funciona como uma solução prática para recuperar o funcionamento do sistema quando esses problemas acontecem.

A ferramenta pode ser especialmente útil em computadores que precisam permanecer ligados por longos períodos.

---

## 🎮 Desenvolvimento

Durante o desenvolvimento, o **Godot Engine** foi utilizado apenas como aplicativo de teste para validar o funcionamento da ferramenta.

O RestApp **não é específico para o Godot** e pode ser configurado para reiniciar diferentes aplicativos.

---

## 📁 Estrutura do projeto

```text
RestApp/
├── RestApp.bat
├── RestApp.ico
└── README.md
```

### Arquivos

* `RestApp.bat` — Script responsável por encerrar e iniciar novamente o aplicativo configurado.
* `RestApp.ico` — Ícone utilizado pelo projeto.
* `README.md` — Documentação do projeto.

---

## ⚙️ Configuração

O aplicativo que será reiniciado pode ser definido diretamente no arquivo:

```text
RestApp.bat
```

Basta configurar o caminho e o processo correspondente ao aplicativo desejado.

---

## 💡 Exemplo de uso

O RestApp pode ser utilizado em situações onde um aplicativo permanece funcionando durante muitas horas e começa a apresentar lentidão ou problemas relacionados ao consumo de memória.

Em vez de reiniciar todo o computador, o usuário pode executar o RestApp para reiniciar somente o aplicativo afetado.

---

## 📌 Status

**Em desenvolvimento.**

O projeto foi criado inicialmente para uso interno e poderá receber melhorias e novos recursos futuramente.

---

## 📄 Licença

Este projeto ainda não possui uma licença definida.
