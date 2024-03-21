'use strict';

const { execSync } = require( 'child_process' );

function getAllLocalOrgs() {
    const orgs = execSync(`sf org list --json`);
    const result = JSON.parse(orgs.toString());
    return result.result.other
        .concat(result.result.sandboxes)
        .concat(result.result.devHubs)
        .concat(result.result.scratchOrgs);
}

const allOrgs = getAllLocalOrgs();
console.log(allOrgs);