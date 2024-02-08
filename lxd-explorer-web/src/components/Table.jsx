import React from 'react';
import Box from '@mui/material/Box';
import { DataGrid } from '@mui/x-data-grid';

const columns = [
    { field: 'id', headerName: '#' ,flex: 1, sortable: false, filterable: false},
    { field: 'name', headerName: 'Name',flex: 1,},
    { field: 'host', headerName: 'Host',flex: 1, groupable: true},
    { field: 'status', headerName: 'Status',flex: 1, type: "singleSelect", valueOptions: ["Running", "Stopped"]},
    { field: 'ip', headerName: 'IP',flex: 1,},
    { field: 'cidr', headerName: 'CIDR',flex: 1,},
    { field: 'os', headerName: 'OS',flex: 1,},
    { field: 'version', headerName: 'Version',flex: 1,},
    { field: 'imageid', headerName: 'Image ID',flex: 1,},
];

const Table = ({ containers }) => {

    const rows = containers.map((container, index) => {
        return {
            id: index + 1,
            name: container.name,
            host: container.host,
            status: container.status,
            ip: container.ip,
            cidr: container.cidr,
            os: container.os,
            version: container.version,
            imageid: container.imageid,
        }
    });

    return (
        <Box sx={{ height: 400, width: '100%' }}>
            <DataGrid
                rows={rows}
                columns={columns}
                autoHeight
                // pageSize={5}
                // rowsPerPageOptions={[5]}
                disableColumnSelector
            />
        </Box>
    );
}

export default Table;
