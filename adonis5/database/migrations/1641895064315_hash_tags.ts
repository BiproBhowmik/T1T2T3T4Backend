import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class HashTags extends BaseSchema {
  protected tableName = 'hash_tags'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.string('hastag')
      table.integer('count').defaultTo(1)
      
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true }).defaultTo(this.now())
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
