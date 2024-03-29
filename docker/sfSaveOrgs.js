'use strict';

const { execSync } = require( 'child_process' );
const fs = require('fs');

function getAllLocalOrgs() {
    const orgs = execSync(`sf org list --json`);
    const result = JSON.parse(orgs.toString());
    return result.result.other
        .concat(result.result.sandboxes)
        .concat(result.result.devHubs)
        .concat(result.result.scratchOrgs);
}

const allOrgs = getAllLocalOrgs();
const authFilesDir = './sfAuthFiles';

if (!fs.existsSync(authFilesDir)) {
    fs.mkdirSync(authFilesDir);
}

allOrgs.forEach(org => {
    execSync(`sf org display --verbose --target-org ${org.alias} --json > ${authFilesDir}\\${org.alias}.json`);
});