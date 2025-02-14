
main:
	jg ./Jasper_RISC_V/scripts/run_cpu_jg.tcl

cpu_check_vcf:
	vcf -f ./Jasper_RISC_V/scripts/run_cpu_vcf.tcl -verdi-base 

.PHONY: clean
clean:
	rm -rf jgproject
	rm -f hector*
	rm -rf vc*
	rm -rf .vc*
	rm -rf novas*
	rm -rf .simon*
	rm -rf verdiLog
	rm -rf .cert*
	rm -f ProofId*
	rm -f verdi*
	rm -rf sysProgress*
	