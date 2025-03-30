Para personalizar o prompt do PowerShell para exibir um texto específico, como `->`. Para fazer isso, você pode alterar o prompt do PowerShell editando a variável `$PROMPT`.

Aqui está como você pode fazer isso:

1. Abra o PowerShell.

2. Digite o seguinte comando para modificar o prompt para exibir `->`:

```powershell
$PROMPT = '-> '
```

Isso vai mudar o prompt temporariamente para `->`. No entanto, se você fechar o PowerShell e abrir novamente, a modificação será perdida.

### Para tornar isso permanente:

Você pode adicionar o comando acima ao seu perfil do PowerShell para que a mudança se aplique toda vez que você abrir o PowerShell.

1. Primeiro, verifique se você tem um arquivo de perfil do PowerShell. Execute o seguinte comando:

```powershell
Test-Path $PROFILE
```

Se o resultado for `False`, significa que o arquivo de perfil não existe. Você pode criá-lo com o comando:

```powershell
New-Item -Path $PROFILE -ItemType File -Force
```

2. Agora, abra o arquivo de perfil para edição:

```powershell
notepad.exe $PROFILE
```

3. Adicione a seguinte linha ao arquivo de perfil:

```powershell
$PROMPT = '-> '
```

4. Salve e feche o arquivo.

Agora, sempre que você abrir o PowerShell, o prompt será alterado para `->`.

Se precisar de mais ajuda, é só avisar!

1. [Migrando do Windows PowerShell 5.1 para o PowerShell 7](https://learn.microsoft.com/pt-br/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.5)

2. [Instalando o PowerShell no Windows](https://learn.microsoft.com/pt-br/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5#winget)


Entendi! Parece que o comando para modificar o prompt com a função `$PROMPT` não está funcionando corretamente no PowerShell 7. Isso ocorre porque o PowerShell 7 usa uma forma diferente de personalizar o prompt. Vamos corrigir isso.

Para alterar o prompt do PowerShell corretamente, você pode usar a função `function prompt {}`. Aqui está como fazer isso:

### 1. Alterando o Prompt para Mostrar o Caminho

Se você quiser que o prompt mostre algo como "MeuTerminal -> C:\Users\maria", você deve definir a função `prompt` no PowerShell dessa maneira:

```powershell
function prompt {
    return "MeuTerminal -> $(Get-Location) "
}
```

Essa função vai fazer com que o prompt mostre o nome que você deseja, seguido pelo caminho atual.

### 2. Tornando a Alteração Permanente

Para que a alteração seja permanente, você deve adicionar essa função ao seu perfil do PowerShell.

1. Abra o seu perfil do PowerShell para edição:

```powershell
notepad.exe $PROFILE
```

2. Adicione a função `prompt` no arquivo de perfil:

```powershell
function prompt {
    return "MeuTerminal -> $(Get-Location) "
}
```

3. Salve e feche o arquivo.

Agora, toda vez que você abrir o PowerShell, o prompt será personalizado e exibirá "MeuTerminal -> C:\Users\maria" ou o caminho atual em vez do formato padrão.

### 3. Título da Janela (Já Resolvido)

Como você já mencionou que a mudança do título da janela deu certo, você já pode ter esse comando no seu perfil para que o título da janela seja alterado toda vez que abrir o PowerShell:

```powershell
$Host.UI.RawUI.WindowTitle = "Terminal"
```

Isso garantirá que o título da janela seja sempre "Terminal".

### Resumo

- **Prompt:** Use a função `prompt` para personalizar o que aparece antes do caminho.
- **Título da janela:** Use `$Host.UI.RawUI.WindowTitle` para definir o título da janela.

Agora, isso deve funcionar como você deseja! Se tiver mais alguma dúvida ou precisar de mais ajuda, é só falar. 


Para mudar a cor do texto no PowerShell, você pode usar o objeto `$Host.UI.RawUI` para definir as propriedades de cor. Aqui está um exemplo de como mudar a cor do texto para um texto verde:

```powershell
# Muda a cor do texto para verde
$Host.UI.RawUI.ForegroundColor = "Green"

# Opcional: para mudar a cor do fundo
$Host.UI.RawUI.BackgroundColor = "Black"

# Exibe um prompt
function prompt {
return "-> "
}
```

Se você quiser usar outras cores, você pode substituir `"Green"` por outras opções, como `"Red"`, `"Yellow"`, `"Cyan"`, `"White"`, entre outras.


O erro que você encontrou indica que a execução de scripts no PowerShell está desabilitada em seu sistema. Para resolver isso, você pode alterar a política de execução do PowerShell. Aqui estão os passos para corrigir isso:

1. **Abra o PowerShell como administrador**:
- Pesquise por "PowerShell" no menu iniciar, clique com o botão direito no Windows PowerShell e selecione "Executar como administrador".

2. **Verifique a política de execução atual**:
Execute o seguinte comando no console do PowerShell:
```powershell
Get-ExecutionPolicy
```

3. **Mude a política de execução**:
Para permitir a execução de scripts, você pode definir a política de execução como "RemoteSigned" ou "Unrestricted". O "RemoteSigned" permite que você execute scripts que você criou localmente e que os scripts baixados da Internet sejam assinados.

Execute um dos seguintes comandos:
- Para definir como `RemoteSigned`:
```powershell
Set-ExecutionPolicy RemoteSigned
```
- Para definir como `Unrestricted`:
```powershell
Set-ExecutionPolicy Unrestricted
```

4. **Confirme a alteração**:
Você será solicitado a confirmar a mudança. Digite `Y` e pressione Enter.

5. **Verifique novamente** (opcional):
Você pode verificar se a política foi alterada corretamente:
```powershell
Get-ExecutionPolicy
```

Depois de seguir esses passos, o erro deve ser resolvido, e você conseguirá executar seus scripts no PowerShell. Lembre-se de ter cuidado ao executar scripts de fontes não confiáveis!
Para remover ou ocultar o banner inicial do PowerShell, que exibe informações como a copyright da Microsoft e recomendações, você pode usar algumas abordagens diferentes. Entretanto, a remoção completa desse texto ao iniciar o PowerShell não é uma configuração oficial. Aqui estão algumas opções que você pode considerar:

1. **Uso do arquivo de perfil**: Você pode editar o arquivo de perfil do PowerShell que é carregado toda vez que você inicia uma sessão. Adicionar um comando para limpar a tela pode ajudar a ocultar o texto inicial. Para fazer isso, siga estas etapas:

- Abra o PowerShell.
- Execute o seguinte comando para abrir seu arquivo de perfil em um editor de texto (caso o arquivo não exista, ele será criado):
```powershell
notepad $PROFILE
```
- Adicione a seguinte linha ao final do arquivo:
```powershell
Clear-Host
```
- Salve e feche o editor.

2. **Iniciando o PowerShell em modo de tela limpa**: Você pode iniciar o PowerShell com uma linha de comando que limpa a tela logo ao abrir. Para fazer isso, crie um atalho e veja as opções avançadas da configuração do atalho:

- Crie um atalho para o PowerShell.
- Clique com o botão direito e vá até "Propriedades".
- Na guia "Atalho", adicione `-NoExit -Command "Clear-Host"` ao final do campo "Destino". O campo deve ficar parecido com isso:
```plaintext
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoExit -Command "Clear-Host"
```

3. **Usar um terminal alternativo**: Algumas pessoas preferem usar terminais alternativos que já oferecem configurações mais personalizáveis e um aspecto mais minimalista, como Windows Terminal, que permite várias configurações e personalizações.

Infelizmente, não há uma maneira direta de desativar essa mensagem de copyright no início da sessão do PowerShell, mas as dicas acima podem ajudar a limpar a apresentação inicial conforme sua preferência.
