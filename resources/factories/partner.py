def factory_404_partner():
    partner = {
        'name': 'Frangão',
        'email': 'contato@frangao.io',
        'whatsapp': '41999999999',
        'business': 'Restaurante'
    }
    return partner

def factory_enable_partner():
    partner = {
        'name': 'Doceria do Ralph',
        'email': 'doces@eu.io',
        'whatsapp': '41999999999',
        'business': 'Conveniência'
    }
    return partner

def factory_remove_partner():
    partner = {
        'name': 'Adega do Ralphito',
        'email': 'contato@adr.io',
        'whatsapp': '41999999999',
        'business': 'Conveniência'
    }
    return partner

def factory_desable_partner():
    partner = {
        'name': 'Mercado Noite',
        'email': 'noite@eu.io',
        'whatsapp': '41999999999',
        'business': 'Supermercado'
    }
    return partner

def factory_new_partner():
    partner = {
        'name': 'Ralph Mangiare',
        'email': 'ralph@eu.io',
        'whatsapp': '41999999999',
        'business': 'Restaurante'
    }
    return partner


def factory_dup_name():
    partner = {
        'name': 'Ralph Mangiare',
        'email': 'ralph@eu.io',
        'whatsapp': '41999999999',
        'business': 'Restaurante'
    }
    return partner


def factory_partner_list():
    p_list = [
        {
        'name': 'Ralph Safadao',
        'email': 'safadao@eu.io',
        'whatsapp': '41999991002',
        'business': 'Conveniência'
        },
        {
        'name': 'Ralph Danadao',
        'email': 'danadao@eu.io',
        'whatsapp': '41999991001',
        'business': 'Supermercado'
        },
        {
        'name': 'Ralph Garanhao',
        'email': 'garanhao@eu.io',
        'whatsapp': '41999991003',
        'business': 'Restaurante'
        }
    ]

    return p_list
