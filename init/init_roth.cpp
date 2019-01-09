/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "init_tegra.h"
#include "service_shield.h"

void vendor_load_properties()
{
	//                                              device     name       model     id    sku   boot device type                 api dpi
	std::vector<tegra_init::devices> devices = { { "roth",    "thor",    "SHIELD",  2560,    0, tegra_init::boot_dev_type::EMMC, 17, 214 },
	                                             { "dalmore", "dalmore", "Dalmore", 1647, 1000, tegra_init::boot_dev_type::EMMC, 17, 240 },
	                                             { "molly",   "molly",   "ADT-1",   1611,    0, tegra_init::boot_dev_type::EMMC, 17, 240 } };
	tegra_init::build_version sav = { "5.1", "LMY47N", "01.00.32208_585.9399" };

	tegra_init ti(devices);
	ti.set_properties();
	ti.set_fingerprints(sav);

	if (ti.is_model("roth"))
		ti.property_set("persist.tegra.panel.rotation", "90");
}

int vendor_handle_control_message(const std::string &msg, const std::string &arg)
{
    return shield_handle_control_message(msg, arg);
}
