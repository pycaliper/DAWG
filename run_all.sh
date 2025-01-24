make clean
wget -nc https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-05-20/oss-cad-suite-linux-x64-20230520.tgz
tar -xvzf oss-cad-suite-linux-x64-20230520.tgz
source oss-cad-suite/environment

start_time=$SECONDS
sby dist_ssh.sby taskKIND10_dist_cacheline_plru -f
elapsed=$(( SECONDS - start_time ))
echo "PLRU_K_Inductive time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskBMC12_dist_cacheline_plru -f
elapsed=$(( SECONDS - start_time ))
echo "PLRU_BMC_12 time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskKIND10_dist_cacheline_nru -f
elapsed=$(( SECONDS - start_time ))
echo "NRU_K_Inductive time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskBMC12_dist_cacheline_nru -f
elapsed=$(( SECONDS - start_time ))
echo "NRU_BMC_12 time is $elapsed seconds" >> time.log

echo "Warning: remaining cases take a long time to terminate or may not terminate at all."

start_time=$SECONDS
sby dist_ssh.sby taskBMC20_dist_cacheline_plru -f
elapsed=$(( SECONDS - start_time ))
echo "PLRU_BMC_20 time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskprove_dist_cacheline_plru -f 
elapsed=$(( SECONDS - start_time ))
echo "PLRU_PDR time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskBMC20_dist_cacheline_nru -f
elapsed=$(( SECONDS - start_time ))
echo "NRU_BMC_20 time is $elapsed seconds" >> time.log

start_time=$SECONDS
sby dist_ssh.sby taskprove_dist_cacheline_nru -f
elapsed=$(( SECONDS - start_time ))
echo "NRU_PDR time is $elapsed seconds" >> time.log
