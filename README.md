# analises-legislativas
Análises sobre a realidade da Câmara Municipal de São Paulo com muitos dados
públicos....

Neste repositório estamos utilizando GIT LFS (Large File System) para gerenciar
os arquivos de dados (grandes).

Para ver como instalar e como funciona visite:
* https://git-lfs.github.com/ e
* https://github.com/github/git-lfs

A tendência por aqui é usar R como linguagem de programação, mas podemos variar
tranquilamente!

O diretório raw_data contém 'dados brutos' (ou quase isso) extraídos das bases
oficiais.

No caso do TSE geralmente os dados vêm quebrados por estado e com encoding
ISO-8859-1 (quando não um mais exótico), então estamos usando os scripts
presentes em 'utils' para convertê-los para UTF-8 e unificá-los num único
arquivo daquele 'tema'.
