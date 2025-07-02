
Create database faculdadeuni;
USE faculdadeuni;

Create Table alunos (
  id_aluno Int not Null auto_increment,
  id_usuario Int Null,
  ativo Bit not Null default 1,
  nome Varchar(100) Null,
  data_nascimento Date Null,
  contato_emergencia Varchar(255) Null Comment 'Telefone e nome contato, é um texto livre\n',
  Primary key (id_aluno),
  Index fk_alunos_id_usuario_idx (id_usuario),
  Constraint fk_alunos_id_usuario Foreign Key (id_usuario) References usuarios (id_usuario)    
);

Create Table alunos_responsaveis (
  id_aluno Int Null,
  id_responsavel Int Null,
  ativo Bit Null,
  Index fk_alunos_responsaveis_alunos_idx (id_aluno),
  Index fk_alunos_responsaveis_responsaveis_idx (id_responsavel),
  Constraint fk_alunos_responsaveis_alunos Foreign Key (id_aluno) References alunos (id_aluno),
  Constraint fk_alunos_responsaveis_responsaveis Foreign Key (id_responsavel) References responsaveis (id_responsavel)    
);

Create Table avaliacoes (
  id_avaliacao Int not Null auto_increment,
  id_aluno Int Null,
  id_unidade Int Null,
  ativo Bit Null,
  tipo_avaliacao Varchar(45) Null,
  nota Decimal(4,2) Null,
  Primary key (id_avaliacao),
  Index avaliacoes_aluno_idx (id_aluno),
  Constraint avaliacoes_alunos Foreign Key (id_aluno) References alunos (id_aluno)
);

Create Table cursos (
  id_curso Int not Null auto_increment,
  ativo Bit not Null default 1,
  nome_curso Varchar(45) Null,
  descricao Text Null,
  id_modalidade Int not Null,
  Primary key (id_curso),
  Index fk_cursos_modalidades_idx (id_modalidade),
  Constraint fk_cursos_modalidades Foreign Key (id_modalidade) References modalidades (id_modalidade)
);

Create Table cursos_disciplinas (
  id_curso Int not Null,
  id_disciplina Int not Null,
  ativo Varchar(45) not Null default '1',
  Index fk_cursos_disciplinas_cursos_idx (id_curso),
  Index fk_cursos_disciplinas_disciplinas_idx (id_disciplina),
  Constraint fk_cursos_disciplinas_disciplinas Foreign Key (id_disciplina) References disciplinas (id_disciplina),
  Constraint fk_cursos_disciplinas_cursos Foreign Key (id_curso) References cursos (id_curso)
);

Create Table disciplinas (
  id_disciplina Int not Null auto_increment,
  ativo Bit not Null default 1,
  nome_disciplina Varchar(45) Null,
  Primary key (id_disciplina));

Create Table funcionarios (
  id_funcionario Int not Null auto_increment,
  setor Varchar(45) Null,
  id_usuario Int Null,
  ativo Bit not Null default 1,
  nome Varchar(100) Null,
  email Varchar(255) Null,
  Primary key (id_funcionario),
  Index fk_funcionarios_id_usuario_idx (id_usuario),
  Constraint fk_funcionarios_id_usuario Foreign Key (id_usuario) References usuarios (id_usuario)
);

Create Table matriculas (
  id_matricula Int not Null auto_increment,
  id_aluno Int Null,
  data_matricula Date Null,
  ativo Bit Null,
  id_turma Int Null,
  Primary key (id_matricula),
  Index fk_matricula_turma_idx (id_turma),
  Index fk_matricula_aluno_idx (id_aluno),
  Constraint fk_matricula_turma Foreign Key (id_turma) References turmas (id_turma),
  Constraint fk_matricula_aluno Foreign Key (id_aluno) References alunos (id_aluno)
);

Create Table modalidades (
  id_modalidade Int not Null auto_increment,
  nome_modalidade Varchar(45) Null Comment 'EAD, Presencial, Semipresencial',
  descricao Text Null,
  ativo Bit Null,
  Primary key (id_modalidade));
  
Create Table perfis (
  id_perfil Int not Null auto_increment,
  ativo Bit not Null default 1,
  descricao Varchar(255) Null,
  nome_perfil Varchar(45) Null,
  Primary key (id_perfil));
  
Create Table professores (
  id_professor Int not Null auto_increment,
  nome Varchar(45) Null,
  email Varchar(100) Null,
  id_usuario Int Null,
  tipo Varchar(45) Null,
  ativo Bit Null,
  Primary key (id_professor),
  Index fk_professores_usuarios_idx (id_usuario),
  Constraint fk_professores_usuarios  Foreign Key (id_usuario) References usuarios (id_usuario)
);

Create Table professores_disciplinas (
  id_professor Int Null,
  id_disciplina Int Null,
  ativo Bit not Null default 1,
  Index fk_professores_disciplinas_professores_idx (id_professor),
  Index fk_professores_disciplinas_disciplinas_idx (id_disciplina),
  Constraint fk_professores_disciplinas_professores Foreign Key (id_professor) References professores (id_professor),
  Constraint fk_professores_disciplinas_disciplinas Foreign Key (id_disciplina) References disciplinas (id_disciplina)    
);

Create Table professores_turmas (
  id_professor Int Null,
  id_turma Int Null,
  ativo Bit Null,
  Index fk_professores_turmas_turmas_idx (id_turma),
  Index fk_professores_turmas_professores_idx (id_professor),
  Constraint fk_professores_turmas_turmas Foreign Key (id_turma) References turmas (id_turma),
  Constraint fk_professores_turmas_professores Foreign Key (id_professor) References professores (id_professor)
);

Create Table responsaveis (
  id_responsavel Int not Null,
  nome Varchar(45) Null,
  telefone Varchar(45) Null,
  cpf Varchar(45) Null,
  email Varchar(45) Null,
  Primary key (id_responsavel));
  
Create Table turmas (
  id_turma Int not Null auto_increment,
  id_tutor_professor Int Null,
  id_curso Int not Null,
  nome_turma Varchar(45) Null,
  Primary key (id_turma),
  Index fk_turmas_id_curso_idx (id_curso),
  Constraint fk_turmas_id_curso Foreign Key (id_curso) References cursos (id_curso)
);

Create Table unidades_internas (
  id_unidade Int not Null auto_increment,
  id_disciplina Int not Null,
  nome_unidade Varchar(45) Null,
  ordem_unidade TINYInt Null,
  Primary key (id_unidade),
  Index fk_cursos_diciplinas_cursos_idx (id_disciplina),
  Constraint fk_inidades_internas_disciplinas Foreign Key (id_disciplina) References disciplinas (id_disciplina)
);

Create Table usuarios (
  id_usuario Int not Null auto_increment,
  id_perfil Int Null,
  ativo Bit not Null default 1,
  email Varchar(255) Null,
  senha_hash Varchar(255) Null,
  Primary key (id_usuario),
  Index fk_usuarios_perfis_idx (id_perfil),
  Constraint fk_usuarios_perfis Foreign Key (id_perfil)  References faculdadeuni.perfis (id_perfil)
);