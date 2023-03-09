import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'qualifications'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('QualCode',20)
      table.string('NationalQualCode',32)
      table.string('TafeQualCode',32)
      table.string('QualName',100)
      table.string('TotalUnits')
      table.string('CoreUnits')
      table.string('ElectedUnits')
      table.string('ReqListedElectedUnits')
      
    


      /**
       * Uses timestamptz for PostgreSQL and DATETIME2 for MSSQL
       */
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
