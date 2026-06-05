import os

# Pasta que contém os 147 arquivos de referência
PASTA_FONTE = r"C:\Users\Edson\Downloads\vertex-hub (29)\vertex-hub\stream"

# Pasta onde será feita a busca e exclusão
PASTA_DESTINO = r"D:\Repositorios\NovaEra\Teste"

# Lista de nomes dos arquivos da pasta fonte
arquivos_para_remover = {
    arquivo
    for arquivo in os.listdir(PASTA_FONTE)
    if os.path.isfile(os.path.join(PASTA_FONTE, arquivo))
}

print(f"Encontrados {len(arquivos_para_remover)} arquivos de referência.")

removidos = 0

# Percorre todas as subpastas do destino
for raiz, _, arquivos in os.walk(PASTA_DESTINO):
    for arquivo in arquivos:
        if arquivo in arquivos_para_remover:
            caminho_completo = os.path.join(raiz, arquivo)

            try:
                os.remove(caminho_completo)
                removidos += 1
                print(f"Removido: {caminho_completo}")
            except Exception as e:
                print(f"Erro ao remover {caminho_completo}: {e}")

print(f"\nConcluído! {removidos} arquivo(s) removido(s).")