import Foundation

var clientName = [String]()
var clientAndress = [String]()
var clientPhone = [String]()
var controlClient = 0
var activatedMenu: Bool = true

enum operacao: String {
    case created = "1"
    case read = "2"
    case update = "3"
    case delete = "4"
    case exit = "5"
}

func menu() {
    print("Menu:")
    print("1 - Criar")
    print("2 - Ler")
    print("3 - Atualizar")
    print("4 - Deletar")
    print("5 - Sair")
    print("Digite a opção desejada:")
}

func input() -> String {
    guard let data = readLine() else {
        print("Erro ao ler a entrada do usuário")
        return ""
    }
    return data
}

func createdClient() {
    print("Digite o nome do cliente:")
    clientName.append(input())
    print("Digite o endereço do cliente:")
    clientAndress.append(input())
    print("Digite o telefone do cliente:")
    clientPhone.append(input())
    controlClient += 1
    print("\u{001B}[2J\u{001B}[;H")
    print("Cliente de número \(controlClient) registrado com sucesso!")
}

func readDb() {
    if clientName.isEmpty {
      print("\u{001B}[2J\u{001B}[;H")
        print("Banco de dados está vazio!")
    } else {
        print("\u{001B}[2J\u{001B}[;H")
      
        print("Total de clientes é \(clientName.count)")
        for i in 0..<clientName.count {
            print("Cliente: \(i + 1)")
            print("Nome: \(clientName[i])\nEndereço: \(clientAndress[i])\nTelefone: \(clientPhone[i])")
           print("-----------------------")
        }
    }
}

func updateClient() {
    readDb()
    if clientName.isEmpty {
      print("\u{001B}[2J\u{001B}[;H")
        print("Banco de dados está vazio!")
        return
    }

    print("Digite o número do cliente que deseja atualizar:")
    guard let num = Int(input()), num <= clientName.count && num > 0 else {
        print("Número de cliente inválido!")
        return
    }
    print("\u{001B}[2J\u{001B}[;H")
    print("Digite o nome do cliente:")
    clientName[num - 1] = input()
    print("Digite o endereço do cliente:")
    clientAndress[num - 1] = input()
    print("Digite o telefone do cliente:")
    clientPhone[num - 1] = input()
    print("Cliente atualizado com sucesso!")
}

func deleteClient() {
    readDb()
    if clientName.isEmpty {
      print("\u{001B}[2J\u{001B}[;H")
        print("Banco de dados está vazio!")
        return
    }
    print("\u{001B}[2J\u{001B}[;H")

    print("Digite o número do cliente que deseja deletar:")
    guard let num = Int(input()), num <= clientName.count && num > 0 else {
        print("Número de cliente inválido!")
        return
    }

    clientName.remove(at: num - 1)
    clientAndress.remove(at: num - 1)
    clientPhone.remove(at: num - 1)
    print("Cliente deletado com sucesso!")
}

while activatedMenu {
    menu()  // Exibe o menu no início do loop

    let option = operacao(rawValue: input())
    switch option {
    case .created:
        print("\u{001B}[2J\u{001B}[;H")
        createdClient()
    case .read:
        print("\u{001B}[2J\u{001B}[;H")
        readDb()
    case .update:
        print("\u{001B}[2J\u{001B}[;H")
        updateClient()
    case .delete:
        print("\u{001B}[2J\u{001B}[;H")
        deleteClient()
    case .exit:
        print("\u{001B}[2J\u{001B}[;H")
        print("Saindo do programa!")
        activatedMenu = false
    default:
        print("Opção inválida!")
    }
}