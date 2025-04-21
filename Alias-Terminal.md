Boa! Criar alias no PowerShell é bem fácil, mas pra **deixar salvo pra sempre**, tem que colocar os aliases num arquivo de perfil que carrega toda vez que o PowerShell abre. Vou te mostrar o caminho:

---

## ✅ **1. Criar alias temporário (pra testar)**

No PowerShell:

```powershell
Set-Alias ls Get-ChildItem
Set-Alias cat Get-Content
Set-Alias pwd Get-Location
```

> Isso funciona **só enquanto o terminal estiver aberto**. Se fechar, perdeu.

---

## 🔒 **2. Deixar os aliases salvos pra sempre**

Você precisa editar o **arquivo de perfil do PowerShell**.

### Passo a passo:

#### 🔍 Ver se o arquivo de perfil já existe:

```powershell
Test-Path $PROFILE
```

Se ele retornar `False`, você cria ele assim:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

#### ✍️ Agora, abra esse arquivo no Bloco de Notas:

```powershell
notepad $PROFILE
```

#### 🧙‍♂️ Dentro do arquivo, adicione seus aliases:

```powershell
Set-Alias ls Get-ChildItem
Set-Alias cat Get-Content
Set-Alias pwd Get-Location
Set-Alias rm Remove-Item
Set-Alias cp Copy-Item
Set-Alias mv Move-Item
```

> Pode colocar quantos quiser!

#### 💾 Salve o arquivo e feche o Notepad.

#### 🔄 Depois, **abra um novo terminal PowerShell** e testa:

```powershell
ls
```

Vai funcionar como o `Get-ChildItem`. Magia feita. ✨

---

Se quiser ir além e fazer funções personalizadas (tipo um `ls` que imprime 3 arquivos por linha ou cores), também rola! Só avisar que te ajudo com isso.

Quer que eu te mande um perfilzinho já com os aliases prontos e umas coisinhas úteis?

Boa! Esse já não é um simples alias porque envolve **pipeline** (`|`) e um pouco mais de lógica — então nesse caso, o ideal é criar uma **função** no PowerShell em vez de um `Set-Alias`.

Vou te mostrar como fazer isso direitinho, e como deixar salvo no seu perfil.

---

## ✅ 1. **Criar função no terminal (só pra testar)**

No PowerShell, digita isso:

```powershell
function lsn {
    (Get-ChildItem | Select-Object -ExpandProperty Name) -join "  "
}
```

Agora, se você digitar:

```powershell
lsn
```

Ele vai listar os arquivos e pastas **um do lado do outro**, separados por espaço.

---

## 🔒 2. **Salvar a função permanentemente**

### Abre seu perfil do PowerShell:

```powershell
notepad $PROFILE
```

Se o arquivo não existir, crie ele com:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
notepad $PROFILE
```

### Cola a função lá dentro:

```powershell
function lsn {
    (Get-ChildItem | Select-Object -ExpandProperty Name) -join "  "
}
```

> Pode adicionar no final do arquivo.

### Salva e fecha. Depois, abre um novo PowerShell e testa:

```powershell
lsn
```

Boom 💥 — agora você tem um comando estilo `ls` que imprime os nomes lado a lado.

---

Se quiser deixar ele mais flexível (com argumentos, por exemplo), também dá pra fazer. Quer uma versão que aceite caminho como parâmetro (`lsn C:\Alguma\Pasta`) também?
