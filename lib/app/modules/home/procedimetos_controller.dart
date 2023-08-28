import 'package:agendamento/app/modules/home/procedimento_model.dart';

class ProcedimentoController {
  List<ProcedimentoModel> buscarProcedimentos() {
    return [
      ProcedimentoModel(
          nome: "LimpezaFacial", descricao: "Remoção de impurezas da pele"),
      ProcedimentoModel(
          nome: "Microdermoabrasao",
          descricao: "Esfoliação suave para renovar a pele"),
      ProcedimentoModel(
          nome: "PreenchimentoLabial",
          descricao: "Aumento dos lábios para efeito estético"),
      ProcedimentoModel(
          nome: "Botox",
          descricao: "Tratamento para suavizar rugas e linhas de expressão"),
      ProcedimentoModel(
          nome: "PeelingQuimico",
          descricao:
              "Aplicação de substâncias para descamar e revitalizar a pele"),
      ProcedimentoModel(
          nome: "DepilacaoLaser",
          descricao: "Remoção de pelos indesejados com laser"),
      ProcedimentoModel(
          nome: "ManicureFrancesa",
          descricao: "Aplicação de esmalte de forma clássica e elegante"),
      ProcedimentoModel(
          nome: "DesignSobrancelhas",
          descricao: "Modelagem das sobrancelhas para realçar o olhar"),
      ProcedimentoModel(
          nome: "TratamentoCabeloQuimico",
          descricao: "Aplicação de produtos para transformação capilar"),
      ProcedimentoModel(
          nome: "MassagemRelaxante",
          descricao: "Massagem suave para relaxamento do corpo"),
      ProcedimentoModel(
          nome: "LiftingFacial",
          descricao: "Procedimento para rejuvenescimento e firmeza da pele"),
    ];
  }
}
