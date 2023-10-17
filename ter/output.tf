output "vms_external_ip" {
value = tomap({
    jenkins-master-01  = "${yandex_compute_instance.vm-1.*.network_interface.0.nat_ip_address}"
    jenkins-agent-01   = "${yandex_compute_instance.vm-2.*.network_interface.0.nat_ip_address}"
})
}