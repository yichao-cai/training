nextflow.enable.dsl=2

sequences = Channel.fromPath('data/prots/*.tfa')
species = ['Human','Mouse']


process align {
  input:
  val x
  each seq

  output:
  file "${x}.aln"

  """
  ls $seq > ${x}.aln
  """
}


workflow{

  genomes = align(Channel.from(species),sequences)

}
