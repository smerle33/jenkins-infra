#!/usr/bin/env groovy

import org.jenkinsci.plugins.pipeline.modeldefinition.config.GlobalConfig

/* Set the default Docker label for Declarative Pipeline to .. wait for it ..
 * docker
 */
GlobalConfig c = GlobalConfiguration.all().find { it instanceof GlobalConfig }
c?.dockerLabel = 'docker'
