# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140905143524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artista_produtos", force: true do |t|
    t.integer  "artista_id"
    t.integer  "produto_id"
    t.decimal  "preco"
    t.integer  "prazo_producao_em_dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artista_produtos", ["artista_id"], name: "index_artista_produtos_on_artista_id", using: :btree
  add_index "artista_produtos", ["produto_id"], name: "index_artista_produtos_on_produto_id", using: :btree

  create_table "categoria", force: true do |t|
    t.string   "nome",                null: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categoria", ["categoria_id"], name: "index_categoria_on_categoria_id", using: :btree

  create_table "categoria_vitrines", force: true do |t|
    t.integer  "categoria_id"
    t.integer  "vitrine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categoria_vitrines", ["categoria_id"], name: "index_categoria_vitrines_on_categoria_id", using: :btree
  add_index "categoria_vitrines", ["vitrine_id"], name: "index_categoria_vitrines_on_vitrine_id", using: :btree

  create_table "categorias_produtos", id: false, force: true do |t|
    t.integer "categoria_id"
    t.integer "produto_id"
  end

  add_index "categorias_produtos", ["categoria_id", "produto_id"], name: "index_categorias_produtos_on_categoria_id_and_produto_id", using: :btree

  create_table "cidades", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado_id"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "colecoes", force: true do |t|
    t.string   "nome"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colecoes_produtos", force: true do |t|
    t.integer  "colecao_id"
    t.integer  "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colecoes_produtos", ["colecao_id"], name: "index_colecoes_produtos_on_colecao_id", using: :btree
  add_index "colecoes_produtos", ["produto_id"], name: "index_colecoes_produtos_on_produto_id", using: :btree

  create_table "estados", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fabrica_produtos", force: true do |t|
    t.integer  "fabrica_id"
    t.integer  "produto_id"
    t.decimal  "preco"
    t.integer  "prazo_producao_em_dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fabrica_produtos", ["fabrica_id"], name: "index_fabrica_produtos_on_fabrica_id", using: :btree
  add_index "fabrica_produtos", ["produto_id"], name: "index_fabrica_produtos_on_produto_id", using: :btree

  create_table "imagens", force: true do |t|
    t.integer  "produto_id"
    t.string   "anexo_file_name"
    t.string   "anexo_content_type"
    t.integer  "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imagens", ["produto_id"], name: "index_imagens_on_produto_id", using: :btree

  create_table "pessoas", force: true do |t|
    t.string   "nome",                     null: false
    t.string   "email",                    null: false
    t.text     "biografia"
    t.date     "iniciou_em"
    t.string   "url_unica"
    t.string   "foto_perfil_file_name"
    t.string   "foto_perfil_content_type"
    t.integer  "foto_perfil_file_size"
    t.datetime "foto_perfil_updated_at"
    t.string   "foto_capa_file_name"
    t.string   "foto_capa_content_type"
    t.integer  "foto_capa_file_size"
    t.datetime "foto_capa_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cidade_id"
  end

  add_index "pessoas", ["cidade_id"], name: "index_pessoas_on_cidade_id", using: :btree

  create_table "produtos", force: true do |t|
    t.string   "nome",               null: false
    t.text     "descricao"
    t.text     "conceito"
    t.string   "url_unica",          null: false
    t.decimal  "preco"
    t.decimal  "preco_promocional"
    t.string   "dimensoes"
    t.float    "peso"
    t.integer  "quantidade_estoque"
    t.integer  "artista_id"
    t.integer  "fabrica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
  end

  add_index "produtos", ["artista_id"], name: "index_produtos_on_artista_id", using: :btree
  add_index "produtos", ["categoria_id"], name: "index_produtos_on_categoria_id", using: :btree
  add_index "produtos", ["fabrica_id"], name: "index_produtos_on_fabrica_id", using: :btree

  create_table "vitrines", force: true do |t|
    t.string   "nome"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
