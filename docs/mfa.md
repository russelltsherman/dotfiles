# MFA

to facilitate proper function of command line mfa otp code generation

create a file for each service in `${XDG_CONFIG_HOME}/mfa/${service}.mfa`

this file should contain only the manual code for the service you wish to enable

to generate a otp for a given service open terminal and execute `mfa servicename`

the appropirate code will be stored in the system clipboard and output to terminal
