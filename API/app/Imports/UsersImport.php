<?php
namespace App\Imports;
use Illuminate\Validation\Rule;
use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsErrors;

class UsersImport implements WithMultipleSheets 
{
   
    public function sheets(): array
    {
        return [
            new FirstSheetImport()
        ];
    }
}

class FirstSheetImport implements ToModel, WithHeadingRow, WithValidation, SkipsOnFailure, SkipsOnError
{

    use Importable, SkipsFailures, SkipsErrors;

    public function model(array $row)
    {
        return new User([
            'nik'  => $row['nik_pengguna'],
            'name'  => $row['nama_pengguna'],
            'division_id' => $row['kode_jabatan'],
            'password' => bcrypt($row['password']),
            'status_id' => 1,
        ]);
    }

    public function rules(): array
    {
        return [
            'nik_pengguna' => Rule::unique('users', 'nik'), // Table name, field in your db
        ];
    }

    public function customValidationMessages()
    {
        return [
            'nik_pengguna.unique' => 'Duplicate',
        ];
    }
}